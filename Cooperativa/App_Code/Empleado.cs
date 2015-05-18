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
/// Descripción breve de Empleado
/// </summary>
public class Empleado
{
	public Empleado()
	{
	
	}

    private Double idEmpleado;

    public Double IdEmpleado
    {
        get { return idEmpleado; }
        set { idEmpleado = value; }
    }

    private DateTime fechaAlta;

    public DateTime FechaAlta
    {
        get { return fechaAlta; }
        set { fechaAlta = value; }
    }

    private DateTime fechaBaja;

    public DateTime FechaBaja
    {
        get { return fechaBaja; }
        set { fechaBaja = value; }
    }

    private Double idCargo;

    public Double IdCargo
    {
        get { return idCargo; }
        set { idCargo = value; }
    }

    private Double idTipoDocumento;

    public Double IdTipoDocumento
    {
        get { return idTipoDocumento; }
        set { idTipoDocumento = value; }
    }

    private Double nroDocumento;

    public Double NroDocumento
    {
        get { return nroDocumento; }
        set { nroDocumento = value; }
    }

    private Double idUsuario;

    public Double IdUsuario
    {
        get { return idUsuario; }
        set { idUsuario = value; }
    }

    private Double Estado;

    public Double Estado1
    {
        get { return Estado; }
        set { Estado = value; }
    }
    private String apellidoEmpleado;
    public String ApellidoEmpleado
    {
        get { return apellidoEmpleado; }
        set { apellidoEmpleado = value; }
    }
    private String nombreEmpleado;
    public String NombreEmpleado
    {
        get { return nombreEmpleado; }
        set { nombreEmpleado = value; }
    }





}
