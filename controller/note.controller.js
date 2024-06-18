import { query } from "../database/db.js"

export const insertNote = async (req, res) => {
    const { title, datetime, note } = req.body;
    try {
        await query("INSERT INTO notes(title, datetime, note) VALUES (?, ?, ?)", [title, datetime, note]);
        return res.status(200).json({ msg: "Note Ditambahkan" });
    } catch (error) {
        console.log("Terjadi kesalahan", error);
        return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
    }
}

export const getNote = async (req, res) => {
    try {
        const result = await query('Select * from notes')
        return res.status(200).json({ success: true, data: result })
    } catch (e) {
        console.log("Terjadi kesalahan", e)
        return res.status(500).json({ msg: "terjadi kesalahan pada server" })
    }
}

export const getNoteById = async (req, res) => {
    const { id } = req.params
    try {
        const result = await query('Select * from notes where id=?', [id])
        return res.status(200).json({ success: true, data: result })
    } catch (e) {
        console.log("Terjadi kesalahan", e)
        return res.status(500).json({ msg: "terjadi kesalahan pada server" })
    }
}

export const updateNote = async (req, res) => {
    const { title, datetime, note } = req.body;
    const { id } = req.params;
    try {
        await query("UPDATE notes SET title=?, datetime=?, note=? WHERE id=?", [title, datetime, note, id]);
        return res.status(200).json({ msg: "Note Diubah" });
    } catch (error) {
        console.log("Terjadi kesalahan", error);
        return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
    }
}

export const deleteNote = async (req, res) => {
    const { id } = req.params
    try {
        await query("DELETE FROM notes where id=?", [id])
        return res.status(200).json({ msg: "Note Dihapus" })
    } catch (error) {
        console.log("Terjadi kesalahan", e)
        return res.status(500).json({ msg: "terjadi kesalahan pada server" })
    }
}