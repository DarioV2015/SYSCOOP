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

/// <summary>
/// Descripción breve de GrupoGuardiaReclamo
/// </summary>
public class GrupoGuardiaReclamo
{

    private int idGrupo;
    public int IdGrupo
    {
        get { return idGrupo; }
        set { idGrupo = value; }
    }
    
    private int idEstado;
    public int IdEstado
    {
        get { return idEstado; }
        set { idEstado = value; }
    }

    private int idVehiculo;
    public int IdVehiculo
    {
        get { return idVehiculo; }
        set { idVehiculo = value; }
    }

    private int idAreaDominio;
    public int IdAreaDominio
    {
        get { return idAreaDominio; }
        set { idAreaDominio = value; }
    }


    public GrupoGuardiaReclamo()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}
