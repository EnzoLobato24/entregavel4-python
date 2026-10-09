def cadastrar_produtos():
    produtos = []
    quantidade = int(input("Quantos produtos deseja cadastrar? "))
    for indice in range(quantidade):
        print(f"\nProduto {indice + 1}")
        nome = input("Nome: ").strip()
        preco = float(input("Preço (R$): ").replace(",", "."))
        categoria = input("Categoria: ").strip()

        produto = {
            "nome": nome,
            "preco": preco,
            "categoria": categoria
        }
        produtos.append(produto)
    return produtos
def filtrar_por_preco(produtos):
    if not produtos:
        print("\nNão há produtos cadastrados.")
        return

    limite = float(
        input("\nInforme o preço de referência (R$): ")
        .replace(",", ".")
    )

    criterio = input(
        "Digite 'a' para acima ou 'b' para abaixo: "
    ).strip().lower()

    if criterio == "a":
        filtrados = [
            produto for produto in produtos
            if produto["preco"] > limite
        ]
        descricao = f"acima de R$ {limite:.2f}"

    elif criterio == "b":
        filtrados = [
            produto for produto in produtos
            if produto["preco"] < limite
        ]
        descricao = f"abaixo de R$ {limite:.2f}"

    else:
        print("Opção inválida.")
        return

    print(f"\nProdutos {descricao}:")

    if filtrados:
        for produto in filtrados:
            print(
                f"- {produto['nome']} | "
                f"R$ {produto['preco']:.2f} | "
                f"{produto['categoria']}"
            )
    else:
        print("Nenhum produto corresponde ao filtro.")


def ordenar_produtos(produtos):
    crescente = produtos.copy()

    crescente.sort(
        key=lambda produto: produto["preco"]
    )

    decrescente = sorted(
        produtos,
        key=lambda produto: produto["preco"],
        reverse=True
    )

    print("\nProdutos por preço crescente:")

    for produto in crescente:
        print(
            f"- {produto['nome']}: "
            f"R$ {produto['preco']:.2f}"
        )

    print("\nProdutos por preço decrescente:")

    for produto in decrescente:
        print(
            f"- {produto['nome']}: "
            f"R$ {produto['preco']:.2f}"
        )


def obter_categorias_unicas(produtos):
    categorias = {
        produto["categoria"] for produto in produtos
    }

    print("\nCategorias únicas:")

    if categorias:
        for categoria in sorted(categorias, key=str.lower):
            print(f"- {categoria}")
    else:
        print("Nenhuma categoria cadastrada.")


def calcular_estatisticas(produtos):
    if not produtos:
        print("\nNão há produtos para calcular estatísticas.")
        return None

    precos = [
        produto["preco"] for produto in produtos
    ]

    estatisticas = (
        min(precos),
        max(precos),
        sum(precos) / len(precos)
    )

    menor, maior, media = estatisticas

    print("\nEstatísticas dos preços:")
    print(f"Menor preço: R$ {menor:.2f}")
    print(f"Maior preço: R$ {maior:.2f}")
    print(f"Preço médio: R$ {media:.2f}")

    return estatisticas
def imprimir_relatorio(produtos):
    print("\n" + "=" * 64)
    print("RELATÓRIO FINAL — SISTEMA DE PRODUTOS")
    print("=" * 64)

    if not produtos:
        print("Nenhum produto foi cadastrado.")
        print("=" * 64)
        return

    print(
        f"{'PRODUTO':<24} "
        f"{'CATEGORIA':<20} "
        f"{'PREÇO (R$)':>12}"
    )

    print("-" * 64)

    for produto in produtos:
        print(
            f"{produto['nome']:<24.24} "
            f"{produto['categoria']:<20.20} "
            f"{produto['preco']:>12.2f}"
        )

    precos = [
        produto["preco"] for produto in produtos
    ]

    categorias = {
        produto["categoria"] for produto in produtos
    }

    print("-" * 64)
    print(f"Quantidade de produtos: {len(produtos)}")
    print(
        "Categorias únicas: "
        f"{', '.join(sorted(categorias, key=str.lower))}"
    )
    print(f"Menor preço: R$ {min(precos):.2f}")
    print(f"Maior preço: R$ {max(precos):.2f}")
    print(
        f"Média dos preços: "
        f"R$ {sum(precos) / len(precos):.2f}"
    )
    print("=" * 64)
def main():
    print("=" * 48)
    print("SISTEMA DE CADASTRO E ANÁLISE DE PRODUTOS")
    print("=" * 48)

    produtos = cadastrar_produtos()

    while True:
        print("\nMENU")
        print("1 - Filtrar por preço")
        print("2 - Ordenar por preço")
        print("3 - Mostrar categorias únicas")
        print("4 - Mostrar estatísticas")
        print("5 - Exibir relatório final")
        print("0 - Sair")

        opcao = input("Escolha uma opção: ").strip()

        if opcao == "1":
            filtrar_por_preco(produtos)

        elif opcao == "2":
            ordenar_produtos(produtos)

        elif opcao == "3":
            obter_categorias_unicas(produtos)

        elif opcao == "4":
            calcular_estatisticas(produtos)

        elif opcao == "5":
            imprimir_relatorio(produtos)

        elif opcao == "0":
            imprimir_relatorio(produtos)
            print("Programa encerrado.")
            break

        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    main()
