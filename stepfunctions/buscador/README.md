## README: Terraform AWS Step Function - poc

Este repositório contém código Terraform para criar uma AWS Step Function que executa duas funções Lambda em paralelo. Certifique-se de seguir estes passos para provisionar a infraestrutura.

### Pré-requisitos

1. Certifique-se de ter o Terraform instalado. Consulte a [documentação oficial do Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) para obter instruções de instalação.

2. Configure suas credenciais da AWS no ambiente. Você pode fazer isso definindo as variáveis de ambiente `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY` ou usando o [AWS CLI](https://aws.amazon.com/cli/).

### Passos para Provisionar a Infraestrutura

1. Clone este repositório:

    ```bash
    git clone {repositorio}
    cd repo-terraform-aws-step-function
    ```

2. Crie um arquivo `terraform.tfvars` e defina as variáveis necessárias. Consulte o arquivo `variables.tf` para as variáveis necessárias.

3. Zip os códigos das suas funções Lambda:

    - Navegue para os diretórios das funções Lambda (por exemplo, `lambda_function_1` e `lambda_function_2`).
    - Execute o comando para criar os arquivos ZIP:

        ```bash
        zip -r lambda_function_1.zip .
        ```

        Repita para a segunda função Lambda.

4. Inicialize o Terraform:

    ```bash
    terraform init
    ```

5. Aplique as alterações:

    ```bash
    terraform apply
    ```

    Será solicitada uma confirmação. Digite `yes` e pressione Enter.

6. Após a conclusão da aplicação, a Step Function e os recursos associados serão provisionados.

### Observações Importantes

- Não se esqueça de remover os recursos quando não precisar mais deles para evitar custos desnecessários. Use o comando:

    ```bash
    terraform destroy
    ```

---

### Diagrama de Execução Paralela

```mermaid
graph TD
    A[Início] -->|Parallel| B[LambdaFunction1]
    A -->|Parallel| C[LambdaFunction2]
    B --> D[Fim]
    C --> D
