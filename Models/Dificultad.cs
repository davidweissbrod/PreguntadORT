public class Dificultad{
    public int IdDificultad {get; set;}
    public string Nombre {get; set;}

    public Dificultad(int idDif, string nom){
        IdDificultad = idDif;
        Nombre = nom;
    }
}