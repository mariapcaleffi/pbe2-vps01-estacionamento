use estacionamento;

insert into Automovel (placa, proprietario, tipo, modelo, marca, cor, ano, telefone) values
('DHR-1201', 'Dahra Fagionato', 'Carro', 'Honda HRV', 'Honda', 'Azul titânio', 2025, '4002-8922'),
('LCM-2304', 'Lucas Menegon', 'Carro', 'Impala', 'Chevrolet', 'Preto', 1967, '4002-8922'),
('LHM-1704', 'Lohaine Mattos', 'Carro', 'Rampage', 'RAM', 'Preto', 2025, '4002-8922'),
('MCC-0406', 'Maria Caleffi', 'Moto', 'Harley Fat Boy', 'Harley Davidson', 'Vinho', 2025, '4002-8922'),
('MCP-0802', 'Maria Caleffi', 'Carro', 'Corcel', 'Ford', 'Vermelho', 1975, '4002-8922');

insert into Estadia (id, entrada, saida, valoHora, valorTotal, automovel) values
(2, '2025-03-28T08:00:00.000Z', '2025-03-28T12:00:00.000Z', 15, 60, 'MCP-0802'),
(3, '2025-03-27T08:00:00.000Z', '2025-03-28T12:00:00.000Z', 15, 420, 'LCM-2304'),
(4, '2025-03-27T08:00:00.000Z', '2025-03-28T12:00:00.000Z', 15, 420, 'DHR-1201'),
(5, '2025-03-27T08:00:00.000Z', '2025-03-28T12:00:00.000Z', 15, 420, 'LHM-1704');

select * from Automovel;
select * from Estadia;