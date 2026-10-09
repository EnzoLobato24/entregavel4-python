algoritmo "sistema_produtos_portugol"

var
   nomes: vetor[1..100] de caractere
   categorias: vetor[1..100] de caractere
   precos: vetor[1..100] de real

   categorias_unicas: vetor[1..100] de caractere

   nomes_ord: vetor[1..100] de caractere
   categorias_ord: vetor[1..100] de caractere
   precos_ord: vetor[1..100] de real

   quantidade, i, j, total_categorias: inteiro
   opcao, criterio: caractere

   limite, menor, maior, soma, media: real
   aux_preco: real

   aux_nome, aux_categoria: caractere
   existe: logico

inicio
   escreval("=== SISTEMA DE CADASTRO E ANALISE ===")
   escreva("Quantos produtos deseja cadastrar (1 a 100)? ")
   leia(quantidade)

   enquanto (quantidade < 1) ou (quantidade > 100) faca
      escreva("Quantidade invalida. Digite de 1 a 100: ")
      leia(quantidade)
   fimenquanto

   // 1. Cadastro dos produtos
   para i de 1 ate quantidade faca
      escreval("")
      escreval("Produto ", i)

      escreva("Nome: ")
      leia(nomes[i])

      escreva("Preco: ")
      leia(precos[i])

      escreva("Categoria: ")
      leia(categorias[i])
   fimpara

   // 2. Conjunto manual de categorias unicas
   total_categorias <- 0

   para i de 1 ate quantidade faca
      existe <- falso

      para j de 1 ate total_categorias faca
         se categorias[i] = categorias_unicas[j] entao
            existe <- verdadeiro
         fimse
      fimpara

      se nao existe entao
         total_categorias <- total_categorias + 1
         categorias_unicas[total_categorias] <- categorias[i]
      fimse
   fimpara

   // 3. Calculo das estatisticas
   menor <- precos[1]
   maior <- precos[1]
   soma <- 0
   para i de 1 ate quantidade faca
      se precos[i] < menor entao
         menor <- precos[i]
      fimse

      se precos[i] > maior entao
         maior <- precos[i]
      fimse

      soma <- soma + precos[i]
   fimpara

   media <- soma / quantidade

   // 4. Menu principal
   repita
      escreval("")
      escreval("========== MENU ==========")
      escreval("1 - Filtrar por preco")
      escreval("2 - Ordenar crescente")
      escreval("3 - Ordenar decrescente")
      escreval("4 - Mostrar categorias unicas")
      escreval("5 - Mostrar estatisticas")
      escreval("6 - Relatorio final")
      escreval("0 - Sair")
      escreva("Opcao: ")
      leia(opcao)

      escolha opcao

         caso "1"
            // Filtragem por preco
            escreva("Preco de referencia: ")
            leia(limite)

            escreva("A para acima ou B para abaixo: ")
            leia(criterio)

            criterio <- maiusculo(criterio)
            existe <- falso

            escreval("Produtos filtrados:")

            para i de 1 ate quantidade faca
               se ((criterio = "A") e (precos[i] > limite)) ou
                  ((criterio = "B") e (precos[i] < limite)) entao

                  escreval(
                     nomes[i], " | R$ ",
                     precos[i]:0:2, " | ",
                     categorias[i]
                  )

                  existe <- verdadeiro
               fimse
            fimpara

            se nao existe entao
               escreval("Nenhum produto encontrado.")
            fimse

         caso "2"
            // Copia os dados para os vetores de ordenacao
            para i de 1 ate quantidade faca
               nomes_ord[i] <- nomes[i]
               categorias_ord[i] <- categorias[i]
               precos_ord[i] <- precos[i]
            fimpara

            // Bubble Sort crescente
            para i de 1 ate quantidade - 1 faca
               para j de 1 ate quantidade - i faca

                  se precos_ord[j] > precos_ord[j + 1] entao

                     aux_preco <- precos_ord[j]
                     precos_ord[j] <- precos_ord[j + 1]
                     precos_ord[j + 1] <- aux_preco

                     aux_nome <- nomes_ord[j]
                     nomes_ord[j] <- nomes_ord[j + 1]
                     nomes_ord[j + 1] <- aux_nome

                     aux_categoria <- categorias_ord[j]
                     categorias_ord[j] <- categorias_ord[j + 1]
                     categorias_ord[j + 1] <- aux_categoria

                  fimse
               fimpara
            fimpara

            escreval("Produtos em ordem crescente:")

            para i de 1 ate quantidade faca
               escreval(
                  nomes_ord[i], " | R$ ",
                  precos_ord[i]:0:2
               )
            fimpara

         caso "3"
            // Copia os dados para os vetores de ordenacao
            para i de 1 ate quantidade faca
               nomes_ord[i] <- nomes[i]
               categorias_ord[i] <- categorias[i]
               precos_ord[i] <- precos[i]
            fimpara

            // Bubble Sort decrescente
            para i de 1 ate quantidade - 1 faca
               para j de 1 ate quantidade - i faca

                  se precos_ord[j] < precos_ord[j + 1] entao

                     aux_preco <- precos_ord[j]
                     precos_ord[j] <- precos_ord[j + 1]
                     precos_ord[j + 1] <- aux_preco

                     aux_nome <- nomes_ord[j]
                     nomes_ord[j] <- nomes_ord[j + 1]
                     nomes_ord[j + 1] <- aux_nome

                     aux_categoria <- categorias_ord[j]
                     categorias_ord[j] <- categorias_ord[j + 1]
                     categorias_ord[j + 1] <- aux_categoria

                  fimse
               fimpara
            fimpara

            escreval("Produtos em ordem decrescente:")

            para i de 1 ate quantidade faca
               escreval(
                  nomes_ord[i], " | R$ ",
                  precos_ord[i]:0:2
               )
            fimpara

         caso "4"
            // Exibe as categorias sem repeticoes
            escreval("Categorias unicas:")

            para i de 1 ate total_categorias faca
               escreval("- ", categorias_unicas[i])
            fimpara

         caso "5"
            // Exibe as estatisticas
            escreval("Menor preco: R$ ", menor:0:2)
            escreval("Maior preco: R$ ", maior:0:2)
            escreval("Media dos precos: R$ ", media:0:2)

         caso "6"
            // Relatorio final
            escreval("")
            escreval("======= RELATORIO FINAL =======")
            escreval("Produto | Categoria | Preco")

            para i de 1 ate quantidade faca
               escreval(
                  nomes[i], " | ",
                  categorias[i], " | R$ ",
                  precos[i]:0:2
               )
            fimpara

            escreval("Quantidade de produtos: ", quantidade)
            escreval("Categorias unicas:")

            para i de 1 ate total_categorias faca
               escreval("- ", categorias_unicas[i])
            fimpara

            escreval("Menor preco: R$ ", menor:0:2)
            escreval("Maior preco: R$ ", maior:0:2)
            escreval("Media dos precos: R$ ", media:0:2)

            escreval("===============================")

         caso "0"
            escreval("Programa encerrado.")

         outrocaso
            escreval("Opcao invalida.")

      fimescolha

   ate opcao = "0"

fimalgoritmo