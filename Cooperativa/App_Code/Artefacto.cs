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

/// <summary>
/// Descripción breve de Artefacto
/// </summary>
[Serializable]
public class Artefacto
{
    private int idArtefacto;

    public int IdArtefacto
    {
        get { return idArtefacto; }
        set { idArtefacto = value; }
    }
    private float consumoPromedio;

    public float ConsumoPromedio
    {
        get { return consumoPromedio; }
        set { consumoPromedio = value; }
    }
    private float hsUsoEstimado;

    public float HsUsoEstimado
    {
        get { return hsUsoEstimado; }
        set { hsUsoEstimado = value; }
    }
    private string marca;

    public string Marca
    {
        get { return marca; }
        set { marca = value; }
    }
    private int nroFactura;

    public int NroFactura
    {
        get { return nroFactura; }
        set { nroFactura = value; }
    }
    private int idTipoArtefacto;

    public int IdTipoArtefacto
    {
        get { return idTipoArtefacto; }
        set { idTipoArtefacto = value; }
    }
    private int idSocio;

    public int IdSocio
    {
        get { return idSocio; }
        set { idSocio = value; }
    }
    private string modelo;

    public string Modelo
    {
        get { return modelo; }
        set { modelo = value; }
    }

    private DateTime fecha;

    public DateTime Fecha
    {
        get { return fecha; }
        set { fecha = value; }
    }

    private string descripcion;

    public string Descripcion
    {
        get { return descripcion; }
        set { descripcion = value; }
    }

    private int idtipoartefacto;

    public int Idtipoartefacto
    {
        get { return idtipoartefacto; }
        set { idtipoartefacto = value; }
    }

    private int idMarca;

    public int IdMarca
    {
        get { return idMarca; }
        set { idMarca = value; }
    }

    public Artefacto()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
