public class Respuestas{
    private int idRespuesta {get; set;}
    private int idPregunta {get; set;}
    private int opcion{get; set;}
    private string contenido{get; set;}
    private bool correcta{get; set;}

    public Respuestas(int idRta, int idPreg, int opc, string cont, bool corr){
        idRespuesta = idRta;
        idPregunta = idPreg;
        opcion = opc;
        contenido = cont;
        correcta = corr;
    }
}