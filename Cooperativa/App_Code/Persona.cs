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

[Serializable]
public class Persona
{
    private int nroDocumento;

    public int NroDocumento
    {
        get { return nroDocumento; }
        set { nroDocumento = value; }
    }
    private int tipoDocumento;

    public int TipoDocumento
    {
        get { return tipoDocumento; }
        set { tipoDocumento = value; }
    }
    private int idDomicilio;

    public int IdDomicilio
    {
        get { return idDomicilio; }
        set { idDomicilio = value; }
    }
    private string nombre;

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    private string apellido;

    public string Apellido
    {
        get { return apellido; }
        set { apellido = value; }
    }
    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    private string sexo;

    public string Sexo
    {
        get { return sexo; }
        set { sexo = value; }
    }
    private long telefono;

    public long Telefono
    {
        get { return telefono; }
        set { telefono = value; }
    }

    private DateTime fechaNacimiento;

    public DateTime FechaNacimiento
    {
        get { return fechaNacimiento; }
        set { fechaNacimiento = value; }
    }

    private string nombreCalle;

    public string NombreCalle
    {
        get { return nombreCalle; }
        set { nombreCalle = value; }
    }

    private int nroCalle;

    public int NroCalle
    {
        get { return nroCalle; }
        set { nroCalle = value; }
    }

    private int idCalle;

    public int IdCalle
    {
        get { return idCalle; }
        set { idCalle = value; }
    }

    private int nroPiso;

    public int NroPiso
    {
        get { return nroPiso; }
        set { nroPiso = value; }
    }

    private string dpto;

    public string Dpto
    {
        get { return dpto; }
        set { dpto = value; }
    }

    private string descripcionZona;

    public string DescripcionZona
    {
        get { return descripcionZona; }
        set { descripcionZona = value; }
    }

    private String descTipoDoc;

    public String DescTipoDoc
    {
        get { return descTipoDoc; }
        set { descTipoDoc = value; }
    }

    private int nroZona;

    public int NroZona
    {
        get { return nroZona; }
        set { nroZona = value; }
    }


    public Persona()
    {
    }

}
