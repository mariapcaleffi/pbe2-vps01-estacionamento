const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const create = async (req, res) => {
    try {
        const { entrada, saida, valorHora, automovelPlaca } = req.body;

        const automovel = await prisma.automovel.findUnique({
            where: { placa: automovelPlaca },
        });

        if (!automovel) {
            return res.status(400).json({ error: 'Automóvel não encontrado.' });
        }

        const horas = Math.ceil((new Date(saida) - new Date(entrada)) / (1000 * 60 * 60));

        const valorTotal = horas * valorHora;

        const estadia = await prisma.estadia.create({
            data: {
                entrada: new Date(entrada),
                saida: new Date(saida),
                valorHora,
                valorTotal,
                automovelPlaca,
            },
        });

        return res.status(201).json(estadia);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const read = async (req, res) => {
    try {
        const estadias = await prisma.estadia.findMany({
            include: { automovel: true },
        });
        return res.status(200).json(estadias);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
};

const readOne = async (req, res) => {
    try {
        const estadia = await prisma.estadia.findUnique({
            where: { id: parseInt(req.params.id) },
            include: { automovel: true },
        });

        if (!estadia) {
            return res.status(404).json({ error: 'Estadia não encontrada.' });
        }

        return res.status(200).json(estadia);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const update = async (req, res) => {
    try {
        const { entrada, saida, valorHora } = req.body;

        const horas = Math.ceil((new Date(saida) - new Date(entrada)) / (1000 * 60 * 60));

        const valorTotal = horas * valorHora;

        const estadia = await prisma.estadia.update({
            where: { id: parseInt(req.params.id) },
            data: {
                entrada: new Date(entrada),
                saida: new Date(saida),
                valorHora,
                valorTotal,
            },
        });

        return res.status(202).json(estadia);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const remove = async (req, res) => {
    try {
        await prisma.estadia.delete({
            where: { id: parseInt(req.params.id) },
        });
        return res.status(204).send();
    } catch (error) {
        return res.status(404).json({ error: error.message });
    }
};

module.exports = { create, read, readOne, update, remove };