const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const create = async (req, res) => {
    try {
        const automovel = await prisma.automovel.create({
            data: req.body,
        });
        return res.status(201).json(automovel);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const read = async (req, res) => {
    try {
        const automoveis = await prisma.automovel.findMany();
        return res.status(200).json(automoveis);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
};

const readOne = async (req, res) => {
    try {
        const automovel = await prisma.automovel.findUnique({
            where: { placa: req.params.placa },
        });

        if (!automovel) {
            return res.status(404).json({ error: 'Automóvel não encontrado.' });
        }

        return res.status(200).json(automovel);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const update = async (req, res) => {
    try {
        const automovel = await prisma.automovel.update({
            where: { placa: req.params.placa },
            data: req.body,
        });
        return res.status(202).json(automovel);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

const remove = async (req, res) => {
    try {
        await prisma.automovel.delete({
            where: { placa: req.params.placa },
        });
        return res.status(204).send();
    } catch (error) {
        return res.status(404).json({ error: error.message });
    }
};

module.exports = { create, read, readOne, update, remove };