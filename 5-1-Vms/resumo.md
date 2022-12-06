## Unidade 2
Vamos explorar as máquinas virtuais, considerações de design e extensões de Vms.

### Explorar maquina virtuais
 O usos podem ser para desenvolvimento e teste no sentido de lift-shift desenvolva e desligue.
 Aplicativos na nuvem no sentido de expansão e readptação de quantidade de máquinas.
 Datatacenter estendido e conexão com o ambiente onpremisses.

### Considerações de design
 - Disponibilidade SLA 99,9% com discos premiuns
 - Tamanho da VM
 - Limites de 20 Vms por região sem abri tickets
 - Imagem da VM com uso de imagens de S.O. personalizadas.
 - Disco de VM onde pode ser por desempenho e o tipo de armazenamento.
    - tipos discos:
        - HDD Armazenamento economicos e alto desempenho. Para testes
        - Premiums: SSD alto desempenho e baixa latencia. Para Produção
    -tipo armazenamento
        - Discos gerenciados garante até 4Tb e é gerneciado pela azure
        - Discos n gerenciados: São VHD usados em contas de armazenamento onde você só paga pelo espaço com 20K de IOPS/s com o maximo de 40 VHD por conta de armazenamento. (Complexo de gferenciar em grandes estruturas.)

### Extesões de VM
Apos implantado podemos executar scripts personalizados tipo = do postgres
- Implantar e gerenciar configurações
- Coletar dados de diagnósticos
- Cloud-init para ambientes linux.

## Unidade 3

- Tópico sobre Zonas de disponibilidade, conjunto de disponibilidade e Balanceador de carga

### Zonas de disponibilidades

- Cada região tem 3 zonas de disponibilidade e cada zona de disponibilidade possui dominio de falha e atualização.
