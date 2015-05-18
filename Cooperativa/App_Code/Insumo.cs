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
/// Descripción breve de Insumo
/// </summary>
[Serializable]
public class Insumo
{
    private int nroInsumo;

    public int NroInsumo
    {
        get { return nroInsumo; }
        set { nroInsumo = value; }
    }
    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    private float especificacion;

    public float Especificacion
    {
        get { return especificacion; }
        set { especificacion = value; }
    }


    private float cantidad;

    public float Cantidad
    {
        get { return cantidad; }
        set { cantidad = value; }
    }

    private string unidadMedida;

    public string UnidadMedida
    {
        get { return unidadMedida; }
        set { unidadMedida = value; }
    }
    private int idTipoInsumo;

    public int IdTipoInsumo
    {
        get { return idTipoInsumo; }
        set { idTipoInsumo = value; }
    }

    private string tipoInsumo;

    public string TipoInsumo
    {
        get { return tipoInsumo; }
        set { tipoInsumo = value; }
    }

    private DateTime fechaVencimiento;

    public DateTime FechaVencimiento
    {
        get { return fechaVencimiento; }
        set { fechaVencimiento = value; }
    }

    public Insumo()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}
