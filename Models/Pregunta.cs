public class Preguntas{
    public int IdPregunta {get; set;}
    public int IdCategoria {get; set;}
    public int IdDificultad {get; set;}
    public string Enunciado {get; set;}

    public Preguntas(int idPreg, int idCat, int idDif, string enun){
        IdPregunta = idPreg;
        IdCategoria = idCat;
        IdDificultad = idDif;
        Enunciado = enun;
    }
}