using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.IO;
using System.Collections.Specialized;
using System.Text;
/// <summary>
/// Descripción breve de Archivo
/// </summary>
public class Archivo
{
    private HttpPostedFile archivo;
    private List<Medicion> medicion;
    /*public static readonly String NROCUENTA = "NROCUENTA";
    public static readonly String NRORUTA = "NRORUTA";
    public static readonly String SECUENCIA = "SECUENCIA";
    public static readonly String ESTADO = "ESTADO";
    public static readonly String DESCONOCIDO = "DESCONOCIDO";
    public static readonly String FECHA = "FECHA";
    public static readonly String HORA = "HORA";
    public static readonly String NOVEDADES = "NOVEDADES";
    public static readonly String DOMICILIOCORREGIDO = "DOMICILIOCORREGIDO";
    public static readonly String NROMEDIDORCORREGIDO = "NROMEDIDORCORREGIDO";*/
    private int lineas;

	public Archivo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public Archivo(HttpPostedFile file)
    {
        archivo = file;
        medicion = new List<Medicion>();
        lineas = 0;
    }

    public List<Medicion>  leerMedicion()
    {
        try
        {
            Medicion medidor;
            Stream fileStream = archivo.InputStream;
            //DataInputStream entrada = new DataInputStream(archivo.getInputStream());  //(fstream);
            // Creamos el Buffer de Lectura
            //BufferedReader buffer = new BufferedReader(new InputStreamReader(entrada));
            StreamReader sr = new StreamReader(fileStream);
            String strLinea;
            // Leer el archivo linea por linea
            //while ((strLinea = sr.ReadLine()) != null && strLinea.Length == 108)
            while ((strLinea = sr.ReadLine()) != null && strLinea.Length == 35)
            {
                // Imprimimos la línea por pantalla
                medidor = new Medicion();
                medidor.NROCUENTA = strLinea.Substring(0, 6);//NROCUENTA es numero de MEDIDOR
                medidor.NRORUTA = strLinea.Substring(6, 3);//3
                medidor.SECUENCIA = strLinea.Substring(9, 5);//5
                medidor.ESTADO = strLinea.Substring(14, 11);//10
              //  medidor.DESCONOCIDO = strLinea.Substring(25, 19);//19
                String fecha = strLinea.Substring(25, 6);//6
                //String fecha = strLinea.Substring(44, 6);//6
                String fechaCompleta = fecha.Substring(0, 2) + "/" + fecha.Substring(2, 2) + "/20" + fecha.Substring(4, 2);
                medidor.FECHA= fechaCompleta;
                //String hora = strLinea.Substring(50, 4);//4
                String hora = strLinea.Substring(31, 4);//4
                String horaCompleta = hora.Substring(0, 2) + ":" + hora.Substring(2, 2);
                medidor.HORA = horaCompleta;
             //   medidor.NOVEDADES = strLinea.Substring(54, 14);//14
             //   medidor.DOMICILIOCORREGIDO = strLinea.Substring(68, 30);//30
             //   medidor.NROMEDIDORCORREGIDO = strLinea.Substring(98, 10);//10
                medicion.Add(medidor);
                lineas++;
            }
            // Cerramos el archivo
            //entrada.close();
        }
        catch (Exception e)
        { //Catch de excepciones
           // System.err.println("Ocurrio un error: " + e.getMessage());
        }
        return medicion;
    }

    public void guardarLinea(String linea)
    {
        string mydocpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
        StringBuilder sb = new StringBuilder();

       /* foreach (string txtName in Directory.EnumerateFiles(mydocpath, "*.txt"))
        {
            using (StreamReader sr = new StreamReader(txtName))
            {
                sb.AppendLine(txtName.ToString());
                sb.AppendLine("= = = = = =");
                sb.Append(sr.ReadToEnd());
                sb.AppendLine();
                sb.AppendLine();
            }
        }*/
        sb.AppendLine(linea);

        using (StreamWriter outfile = new StreamWriter(mydocpath + @"\AllTxtFiles.txt",true))
        {
            outfile.Write(sb.ToString());
        }
    }
}
