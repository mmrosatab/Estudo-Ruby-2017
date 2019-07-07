class No

	attr_accessor :chave,:dir,:esq

	def initialize(chave)
		@chave = chave
		@dir = nil
		@esq = nil
	end
end

class ArvoreBinaria
	
	attr_accessor :raiz

	def initialize()
		@raiz = nil
	end

	def estaVazia()
		if @raiz == nil
			return true
		else
			return false
		end
	end

	def inserir(chave)
		
		if estaVazia()
			@raiz = No.new(chave)
			return true

		elsif busca(chave) == false
			aux = @raiz

			while aux != nil	
				if chave > aux.chave && aux.dir == nil
					aux.dir = No.new(chave)
				elsif chave < aux.chave && aux.esq == nil
					aux.esq = No.new(chave)
				elsif chave > aux.chave
					aux = aux.dir
				else chave < aux.chave
					aux = aux.esq
				end
			end
			return true
		else
			print "chave já existe"
		end
	end

	def busca(chave)
		
		if estaVazia()
			return false
		else
			aux = @raiz

			while aux != nil 
				if chave == aux.chave
					return true 
				elsif chave > aux.chave
					aux = aux.dir
				else
					aux = aux.esq
				end
			end
			return false
		end
	end


	def preOrdem(no = @raiz)
		
		if no != nil 
			printf "%d ",no.chave
			preOrdem(no.esq)
			preOrdem(no.dir)
		end
	end

	def inOrdem(no = @raiz)
		
		if no != nil 
			inOrdem(no.esq)
			printf "%d ",no.chave
			inOrdem(no.dir)
		end
	end

	def posOrdem(no = @raiz)
		
		if no != nil 
			posOrdem(no.esq)
			posOrdem(no.dir)
			printf "%d ",no.chave
		end
	end

	def imprimir() 
		print "Pre.:"
		preOrdem()
		print "\n"
		print "In..:"
		inOrdem()
		print "\n"
		print "Post:"
		posOrdem()
		print "\n"
	end
end

c = gets
i = 0

listas = []

while i < c.to_i 

	n = gets
	numeros = gets.chomp
	array = numeros.split(" ",n.to_i)
	u = 0
	lista = []

	for y in array
		lista[u] = y.to_i
		u = u + 1
	end

	listas[i] = lista 
	i = i + 1
end

i = 1

for lista in listas
	ab = ArvoreBinaria.new
	
	for j in lista
		ab.inserir(j.to_i)
	end

	printf "Case %d: \n",i
	ab.imprimir()
	printf "\n"
	i = i + 1

end

