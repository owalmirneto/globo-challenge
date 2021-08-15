# Seleção para plataforma de áudio e vídeos da [Globo.com](globo.com)

![GamePlay](gameplay.png?raw=true 'GamePlay')

Esse Códido desenvolvido para seleção de desenvolvedor backend para plataforma
de audio e vídeos da Globo.com. Foi escolhido para este teste o desafio
[**1 - Breath of Fantasy**](CHALLENGER.md#1---breath-of-fantasy).

## Requirementos

- Instalar [Ruby 3.0.2](ruby-lang.org/pt/documentation/installation/#installers)

## Setup

Rodar o setup abaixo:

```bash
bin/setup
```

## Start battle


```bash
bin/start
```

É possível rodar a versão em inglês ou brasileira


```bash
LOCALE=en bin/start
# or
LOCALE=pt-BR bin/start # Essa e a default
```

## Testes

#### CI

```bash
bin/ci
```

#### Rubocop

```bash
bin/rubocop # to verify
# or
bin/rubocop -A # to verify and fix
```

#### RSpec

```bash
bin/rspec
```
