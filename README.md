# **🎬 Modelagem de Dados em Grafos — Serviço de Streaming**

Projeto desenvolvido como parte do desafio **“Modelagem de Dados em Grafos”**, estruturando um grafo completo para um serviço de streaming utilizando **Neo4j**.

O objetivo é criar uma base que permita recomendações eficientes, descobertas de conteúdo e análise avançada de relacionamento entre usuários, filmes, séries, gêneros, atores e diretores.

---

## 🧠 **Objetivo do Projeto**

Construir um grafo funcional contendo:

* **Entidades (Nós)**

  * `User`
  * `Movie`
  * `Series`
  * `Genre`
  * `Actor`
  * `Director`

* **Relacionamentos (Arestas)**

  * `WATCHED` *(inclui propriedade `rating`)*
  * `ACTED_IN`
  * `DIRECTS`
  * `IN_GENRE`

---

## 🔗 **Diagrama do Grafo**

O diagrama foi criado no Excalidraw e representa visualmente as entidades e seus relacionamentos:

👉 **Acesse aqui:**
[https://excalidraw.com/#json=jcXc-zzgKrxSxYh_Y366h,EekQ4-Yb14Ewp_vR0I25qQ](https://excalidraw.com/#json=jcXc-zzgKrxSxYh_Y366h,EekQ4-Yb14Ewp_vR0I25qQ)

---

## 🧩 **Modelagem Conceitual**

A estrutura geral do grafo segue este modelo:

```
(User) -[:WATCHED {rating}]-> (Movie / Series)
(Actor) -[:ACTED_IN]-> (Movie / Series)
(Director) -[:DIRECTS]-> (Movie / Series)
(Movie / Series) -[:IN_GENRE]-> (Genre)
```

Esse formato permite:

* Recomendações por similaridade
* Análises baseadas em comportamento do usuário
* Exploração de conteúdo por gênero, elenco ou direção
* Conexões rápidas entre itens relacionados

---

## 🛠️ **Tecnologias Utilizadas**

* **Neo4j Aura / Neo4j Desktop**
* **Cypher Query Language**
* **Excalidraw** (diagrama visual)

---

## 📜 **Conteúdo do Script**

O script Cypher desenvolvido no projeto inclui:

✔ Criação de constraints (IDs únicos)
✔ Inserção de entidades
✔ Modelagem de relacionamentos
✔ Atributos relevantes (como `rating` do usuário)

---

## 🚀 **Como Executar**

1. Acesse seu Neo4j (Aura ou Desktop)
2. Abra o Neo4j Browser
3. Copie o script `.cypher` do repositório
4. Execute com **Shift + Enter**

Após a execução, você pode visualizar tudo com:

```cypher
MATCH (n) RETURN n;
```

---

## 📝 **Resultado**

Esse grafo serve como base para:

* Sistemas de recomendação
* Data science com grafos
* Exploração visual de relacionamentos
* Estudos de modelagem com Neo4j

---

## ✨ **Autor**

Lucas Gabriel Ferreira Gomes
