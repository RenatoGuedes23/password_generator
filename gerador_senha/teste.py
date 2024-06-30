import random
import string

def gerar_senha_com_numeros(tamanho=12):
    caracteres = string.ascii_letters + string.digits + string.punctuation
    senha = ''.join(random.choice(caracteres) for _ in range(tamanho))
    return senha

# Supondo que tamanho seja igual a 12 para este exemplo
tamanho = 12
caracteres = string.ascii_letters + string.digits + string.punctuation
print(f"Caracteres possíveis para a senha: {caracteres}")

senha = ''.join(random.choice(caracteres) for _ in range(tamanho))
print(f"Senha gerada passo a passo:")

for i in range(tamanho):
    char_escolhido = random.choice(caracteres)
    print(f"Iteração {i + 1}: Caractere escolhido: {char_escolhido}")

    if i == 0:
        senha = char_escolhido
    else:
        senha += char_escolhido

print(f"Senha final gerada: {senha}")