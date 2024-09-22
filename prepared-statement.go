stmt, err := db.Prepare("SELECT name FROM users WHERE id = ? AND name = ? AND age = ?")
if err != nil {
    return err
}
defer stmt.Close()

_, err = stmt.Exec(1, "t", 99)
if err != nil {
    panic(err)
}

_, err = stmt.Exec(2, "t", 100)
if err != nil {
    panic(err)
}