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
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de OTC
/// </summary>
public class OTC
{
    public OTC()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public OrdenTrabajoCorrectivo traerOTCEnCurso(int grupoGR)
    {
        string sql = "select distinct otc.idordentrabajo, otc.fechainicio, otc.horainicio, otc.prioridad," + 
        " tr.descripcion as 'Tipo de Reclamo'," +
        " c.nombre, d.nrocalle, d.piso, d.dpto, z.descripcion as Zona, z.idzona, tr.idtiporeclamo" + 
        " from ordentrabajocorrectivo otc, calle c, domicilio d, zona z, tiporeclamo tr, reclamo r" + 
        " where otc.iddomicilio = d.iddomicilio" + 
        " and d.idcalle = c.idcalle" + 
        " and d.idzona = z.idzona" + 
        " and r.idtiporeclamo = tr.idtiporeclamo" +
        " and r.idordentrabajocorrectivo = otc.idordentrabajo" +
        " and otc.idestadoot = 1 and otc.idguardiareclamo = " + grupoGR;

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        OrdenTrabajoCorrectivo otc = new OrdenTrabajoCorrectivo();

        while (dr.Read())
        {
            otc.NroOTC = Convert.ToInt32(dr[0]);
            otc.FechaInicio = Convert.ToDateTime(dr[1]);
            otc.HoraInicio = Convert.ToDateTime(dr[2]);
            otc.Prioridad = Convert.ToSingle(dr[3]);
            otc.TipoReclamo = dr[4].ToString();
            otc.NombreCalle = dr[5].ToString();
            otc.NroCalle = Convert.ToInt32(dr[6]);
            otc.Piso = Convert.ToInt32(dr[7]);
            otc.Dpto = dr[8].ToString();
            otc.Zona = dr[9].ToString();
            otc.NroZona = Convert.ToInt32(dr[10]);
            otc.NroTipoReclamo = Convert.ToInt32(dr[11]);
        }

        dr.Close();
        return otc;
    }
    public bool verSIOTC(int grupoGR)
    {
        string sql = "select count(*)from ordentrabajocorrectivo otc where otc.idestadoot = 1 and otc.idguardiareclamo = " + grupoGR;

        int filas = Datos.obtenerEscalar(sql);
        bool hayOTC;

        if(filas > 0)
            hayOTC = true;
        else
            hayOTC = false;

        return hayOTC;
    }
    public OrdenTrabajoCorrectivo traerOTCaFinalizar(int grupoGR, int nroOTC)
    {
        string sql = "select otc.fechainicio, otc.horainicio, c.nombre," +  
        " d.nrocalle, d.piso, d.dpto, z.descripcion" +
        " from ordentrabajocorrectivo otc, domicilio d, calle c, zona z" +
        " where otc.idestadoot = 1" +
        " and otc.iddomicilio = d.iddomicilio" +
        " and d.idcalle = c.idcalle" +
        " and d.idzona = z.idzona" +
        " and otc.idguardiareclamo = " + grupoGR + 
        " and otc.idordentrabajo = " + nroOTC;

        SqlDataReader dr = Datos.obtenerDataReader(sql);

        OrdenTrabajoCorrectivo otc = new OrdenTrabajoCorrectivo();

        while (dr.Read())
        {
            otc.FechaInicio = Convert.ToDateTime(dr[0]);
            otc.HoraInicio = Convert.ToDateTime(dr[1]);
            otc.NombreCalle = dr[2].ToString();
            otc.NroCalle = Convert.ToInt32(dr[3]);
            otc.Piso = Convert.ToInt32(dr[4]);
            otc.Dpto = dr[5].ToString();
            otc.Zona = dr[6].ToString();
        }

        dr.Close();
        return otc;
    }
    public OrdenTrabajoCorrectivo verSIOTCaFinalizar(int grupoGR)
    {
        string sql = "select idordentrabajo" +
        " from ordentrabajocorrectivo" +
        " where idestadoot = 1" +
        " and idguardiareclamo = " + grupoGR;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        OrdenTrabajoCorrectivo otc = new OrdenTrabajoCorrectivo();

        while (dr.Read())
        {
            otc.NroOTC = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return otc;
    }
    public int obtenerUltimoDetalleOTC()
    {
        string sql = "select max(idDetalle) from DetalleOrdenTrabajoCorrectivo";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoDetalleInsumo()
    {
        string sql = "select max(idDetalleInsumo) from DetalleInsumo";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int obtenerUltimoDetalleHerrXOTC()
    {
        string sql = "select max(idDetalleHerramienta) from HerramientaPorOTC with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }
    public int actualizarOTC(int nroOTC, DateTime fecha, int estado, DateTime hora, int idUsuario, float tiempo)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", nroOTC));
        param.Add(new SqlParameter("@b", fecha));
        param.Add(new SqlParameter("@c", estado));
        param.Add(new SqlParameter("@d", hora));
        param.Add(new SqlParameter("@e", idUsuario));
        param.Add(new SqlParameter("@f", tiempo));

        //fechaFin - estadoOT - horaFin - idUsuario - tiempoResolucion
        string sql = "update ordentrabajocorrectivo set fechafin = @b," +
        " idestadoot = @c, horafin = @d, idusuario = @e, tiemporesolucion = @f" +
        " where idordentrabajo = @a";

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql,param);
        }
        catch(SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public int actualizarReclamoAFinalizado(int nroOTC)
    {
        string sql = "update reclamo set idestadoreclamo = 3 " + 
        " where idordentrabajocorrectivo = " + nroOTC;

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public int liberarGrupoGR(int nroGrupo)
    {
        string sql = "update g set idestadoguardiareclamo = 1" +
        " from grupoguardiareclamo g, ordentrabajocorrectivo otc" +
        " where otc.idguardiareclamo = " + nroGrupo;

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public int crearDetalleOTC(List<DetalleOTC> detalle)
    {
        string sql = "insert into DetalleOrdenTrabajoCorrectivo(idDetalle, idOrdenTrabajo, idProblema, idSolucion) values (@a,@b,@c,@d)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (DetalleOTC d in detalle)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", d.NroDetalle));
                param.Add(new SqlParameter("@b", d.NroOTC));
                param.Add(new SqlParameter("@c", d.NroProblema));
                param.Add(new SqlParameter("@d", d.NroSolucion));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int crearDetalleHerrXOTC(List<HerramientaPorOTC> herramientas)
    {
        string sql = "insert into HerramientaPorOTC(idDetalleHerramienta, idOtc, idHerramienta) values (@a,@b,@c)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            
            foreach (HerramientaPorOTC h in herramientas)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", h.NroDetalleHerramienta));
                param.Add(new SqlParameter("@b", h.NroOTC));
                param.Add(new SqlParameter("@c", h.NroHerramienta));

            
                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int crearDetalleInsumo(List<DetalleInsumo> insumos)
    {
        string sql = "insert into DetalleInsumo(idDetalleOTC, idDetalleInsumo, idInsumo, cantidad, idOtc) values (@a,@b,@c, @d,@e)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (DetalleInsumo d in insumos)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", d.NroDetalleOTC));
                param.Add(new SqlParameter("@b", d.NroDetalleInsumo));
                param.Add(new SqlParameter("@c", d.NroInsumo));
                param.Add(new SqlParameter("@d", d.Cantidad));
                param.Add(new SqlParameter("@e", d.NroOTC));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int cantidadTiempos(int tipoReclamo)
    {
        string sql = "select count(distinct otc.tiemporesolucion)" +
         " from ordentrabajocorrectivo otc, reclamo r" +
         " where r.idordentrabajocorrectivo = otc.idordentrabajo" +
         " and r.idestadoreclamo = 2" +
         " and otc.idestadoot = 3" +
         " and r.idtiporeclamo = " + tipoReclamo;

        int filas = 0;

        try
        {
            filas = Datos.obtenerEscalar(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public float traerTiemposResolucion(int tipoReclamo)
    {
        string sql = "select sum(distinct otc.tiemporesolucion)" +
        " from ordentrabajocorrectivo otc, reclamo r" +
        " where r.idordentrabajocorrectivo = otc.idordentrabajo" +
        " and r.idestadoreclamo = 2" +
        " and otc.idestadoot = 3" +
        " and r.idtiporeclamo = " + tipoReclamo;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        float tiempos = 0;

        while (dr.Read())
        {
            if (dr[0].GetType() == Type.GetType("System.DBNull"))
                tiempos = 0;
            else
                tiempos = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return tiempos;
    }
    public int setearTiempoResolucion(int tipoReclamo, float tiempo)
    {
        string sql = "update tiporeclamo set tiemporesolucion = @b where idtiporeclamo = @a";

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", tipoReclamo));
        param.Add(new SqlParameter("@b", tiempo));
        
        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql,param);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public float calcularTiempoResolucion(int nroOTC, DateTime fechaFin)
    {
        string sql = "SELECT DATEDIFF(minute,fechainicio," + "'" + fechaFin + "')" + 
        " from ordentrabajocorrectivo" +
        " where idordentrabajo = " + nroOTC;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        float tiempo = 0;

        while (dr.Read())
        {
            if (dr[0].GetType() == Type.GetType("System.DBNull"))
                tiempo = 0;
            else
                tiempo = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return tiempo;
    }
    public int setearStockCantidad(float cantidadUsada, int nroInsumo)
    {
        string sql = "update stockinsumo" + 
        " set cantidad = (cantidad - " + cantidadUsada + ")" +
        " where idinsumo = " + nroInsumo;

        List<SqlParameter> param = new List<SqlParameter>();

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public float verStockNoCuantificable(float cantidadUsada, int nroInsumo)
    {
        string sql = "select (i.especificacion - (sum(di.cantidad) + " + cantidadUsada + "))" +
        " from detalleinsumo di, insumo i" +
        " where di.idinsumo = " + nroInsumo +
        " and di.idinsumo = i.idinsumo" +
        " group by i.especificacion";

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        float stock = 0;

        while (dr.Read())
        {
            stock = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return stock;
    }
    public int devolverEspecificacion(int nroInsumo)
    {
        string sql = "select i.especificacion" +
        " from insumo i" +
        " where i.idinsumo = " + nroInsumo;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        int especificacion = 0;

        while (dr.Read())
        {
            especificacion = Convert.ToInt32(dr[0]);
        }

        dr.Close();
        return especificacion;
    }
    public int crearInsumSobrante(List<InsumoSobrante> iss)
    {
        string sql = "insert into InsumoSobrante(idInsumo, cantidadSobrante, idGrupo) values (@a,@b,@c)";
        List<SqlParameter> param;

        int filas = -1;
        string msg = " ";

        try
        {
            foreach (InsumoSobrante ins in iss)
            {
                param = new List<SqlParameter>();

                param.Add(new SqlParameter("@a", ins.NroInsumo));
                param.Add(new SqlParameter("@b", ins.CantidadSobrante));
                param.Add(new SqlParameter("@c", ins.NroGrupo));

                filas = Datos.ejecutarComando(sql, param);
            }
        }
        catch (SqlException s)
        {
            msg = s.Message.ToString();
        }

        return filas;
    }
    public int setearStockNoCuantificable(float cantidadUsada, int nroInsumo)
    {
        string sql = "update stockinsumo set cantidad =  (cantidad - " + cantidadUsada + ")" + 
        " where idinsumo = " + nroInsumo;

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public int eliminarInsumoSobrante(int nroInsumo)
    {
        string sql = "delete insumosobrante" +
        " where idinsumo = " + nroInsumo;

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public float verificarSuperaEspecificacion(float cantidad, int nroInsumo)
    {
        string sql = "select (sum(ins.cantidadsobrante) + " + cantidad + ")" + 
        " from insumosobrante ins" +
        " where ins.idinsumo = " + nroInsumo;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        float cant= 0;

        while (dr.Read())
        {
            if (dr[0].GetType() == Type.GetType("System.DBNull"))
               cant = cantidad;
            else
               cant = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return cant;
    }
    public float devolverStockInsumo(int nroInsumo)
    {
        string sql = "select sum(cantidad)" +
        " from stockinsumo" +
        " where idinsumo = " + nroInsumo;

        SqlDataReader dr = Datos.obtenerDataReader(sql);
        float stock = 0;

        while (dr.Read())
        {
            if (dr[0].GetType() == Type.GetType("System.DBNull"))
                stock = 0;
            else
                stock = Convert.ToSingle(dr[0]);
        }

        dr.Close();
        return stock;
    }
    public bool haySobrante(int nroInsumo)
    {
        string sql = "select count(*)" +
        " from insumosobrante" +
        " where idinsumo = " + nroInsumo +
        " and cantidadsobrante <> 0";

        int filas = Datos.obtenerEscalar(sql);
        bool hayStock;

        if (filas > 0)
            hayStock = true;
        else
            hayStock = false;

        return hayStock;
    }
    public int actualizarSobrante(float cantidadUsada, int nroInsumo)
    {
        string sql = "update insumosobrante set cantidadsobrante =  " + cantidadUsada + 
        " where idinsumo = " + nroInsumo;

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public Reclamo obtenerDatosReclamoActual(int nroReclamo)
    {
        SqlParameter p = new SqlParameter("@a", nroReclamo);

        String sql = "select distinct r.idreclamo, s.idsocio, p.tipodocumento,  tp.descripcion tipodoc, " +
            " p.nrodocumento, r.descripcion descripcion, tr.idtiporeclamo tiporeclamo, r.fecha, r.hora, " +
            " tr.prioridad, p.apellido, p.nombre, z.idzona , r.idordentrabajocorrectivo, r.iddomicilio, c.nombre nombrecalle, " +
            " d.nrocalle, d.piso, d.dpto, z.descripcion desczona, tr.descripcion descTipoReclamo, pro.descripcion descprioridad " +
            " from Reclamo r with(NOLOCK), persona p with(NOLOCK), socio s with(NOLOCK), tiporeclamo tr with(NOLOCK), prioridad pro, " +
            " domicilio d with(NOLOCK), calle c with(NOLOCK), zona z with(NOLOCK), tipodocumento tp with(NOLOCK) " +
            " where r.idsocio = s.idsocio " +
            " and s.idtipodocumento = p.tipodocumento " +
            " and s.nrodocumento = p.nrodocumento " +
            " and p.tipodocumento = tp.idtipodocumento " +
            " and r.idtiporeclamo = tr.idtiporeclamo " +
            " and r.iddomicilio = d.iddomicilio " +
            " and d.idcalle = c.idcalle " +
            " and d.idzona = z.idzona " +
            " and pro.idprioridad = tr.prioridad " +
            " and r.idreclamo = @a";

        SqlDataReader sdr = Datos.obtenerDataReader(sql,p);
        Reclamo r = new Reclamo();

        while (sdr.Read())
        {
            r.NroReclamo =  Convert.ToInt32(sdr["idreclamo"].ToString());
            r.NroSocio = Convert.ToInt32(sdr["idsocio"].ToString());
            r.Socio.TipoDocumento = Convert.ToInt32(sdr["tipodocumento"].ToString());
            r.Socio.DescripcionTipoDoc = sdr["tipodoc"].ToString();
            r.Socio.DescTipoDoc = sdr["tipodoc"].ToString();
            r.Socio.NroDocumento = Convert.ToInt32(sdr["nrodocumento"].ToString());
            r.Socio.Nombre = sdr["nombre"].ToString();
            r.Socio.Apellido = sdr["apellido"].ToString();
            r.Descripcion = sdr["descripcion"].ToString();
            r.TipoReclamo = sdr["tiporeclamo"].ToString();
            r.DescripcionTipoReclamo = sdr["descTipoReclamo"].ToString();
            r.Prioridad = sdr["prioridad"].ToString();
            r.DescPriodidad = sdr["descprioridad"].ToString();
            r.Calle = sdr["nombrecalle"].ToString();

            if (sdr["nrocalle"].GetType() != Type.GetType("System.DBNull"))
                r.NroCalle = Convert.ToInt32(sdr["nrocalle"].ToString());
            else
                r.NroCalle = 0;

            if (sdr["piso"].GetType() != Type.GetType("System.DBNull"))
                r.Piso = Convert.ToInt32(sdr["piso"].ToString());
            else
                r.Piso = 0;

            if (sdr["dpto"].GetType() != Type.GetType("System.DBNull"))
                r.Dpto = sdr["dpto"].ToString();
            else
                r.Dpto = Convert.ToString("0");

            r.Zona = sdr["idzona"].ToString();
            r.DescZona = sdr["desczona"].ToString();
            r.IdDomicilio = Convert.ToInt32(sdr["iddomicilio"].ToString());
           // r.NroOTC = Convert.ToInt32(sdr["idordentrabajocorrectivo"].ToString());

        }
        sdr.Close();
        return r;

    }


    public OrdenTrabajoCorrectivo buscarOTCPendiente(String tipoReclamo, String zona)
    {
        String sqlReclamo = " select distinct otc.idordentrabajo, otc.fechainicio, otc.idguardiareclamo, otc.idusuario, otc.prioridad, otc.idestadoot, otc.iddomicilio, otc.tiemporesolucion, p.descripcion pdesc " +
                            " from ordentrabajocorrectivo otc with(NOLOCK), domicilio d with(NOLOCK), reclamo r with(NOLOCK), prioridad p with(NOLOCK) " +
                            " where otc.iddomicilio = d.iddomicilio "+
                            " and p.idprioridad = otc.prioridad " +
                            " and r.idordentrabajocorrectivo = otc.idordentrabajo "+
                            " and otc.idestadoot in (2,1) "+//pendiente
                            " and r.idtiporeclamo = "+tipoReclamo+
                            " and d.idzona = "+zona;

        SqlDataReader sdr = Datos.obtenerDataReader(sqlReclamo);
        OrdenTrabajoCorrectivo otc = null;

        while (sdr.Read())
        {
            otc = new OrdenTrabajoCorrectivo();
            otc.NroOTC = Convert.ToInt32(sdr["idordentrabajo"].ToString());
            //otc.FechaInicio = sdr["fechainicio"].ToString();
            otc.NroGrupoGR = Convert.ToInt32(sdr["idguardiareclamo"].ToString());
            otc.Usuario = sdr["idusuario"].ToString();
            otc.Prioridad = Convert.ToInt32(sdr["prioridad"].ToString());
            otc.DescPriodidad = sdr["pdesc"].ToString();
            otc.Estado = sdr["idestadoot"].ToString(); ;
            otc.IdDomicilio = Convert.ToInt32(sdr["iddomicilio"].ToString()); 
            //otc.TiempoResolucion = Convert.ToSingle(sdr["tiemporesolucion"].ToString()); 
        }

        sdr.Close();
        return otc;
           

    }

    public List<Reclamo> buscarReclamosOTC(String nroOTC)
    {
        String sqlReclamo = "select r.idreclamo, s.idsocio, tp.descripcion tipodoc, " +
            " p.nrodocumento, r.descripcion descripcion, tr.descripcion tiporeclamo, convert(char(10), r.fecha, 103) as fecha, convert(nvarchar(5), r.hora, 108) as hora, " +
            " tr.prioridad, p.apellido, p.nombre, z.descripcion desczona" +
            " from Reclamo r with(NOLOCK), persona p with(NOLOCK), socio s with(NOLOCK), tiporeclamo tr with(NOLOCK), "+
            " estadoreclamo er with(NOLOCK), domicilio d with(NOLOCK), calle c with(NOLOCK), zona z with(NOLOCK), tipodocumento tp with(NOLOCK) " +
            " where r.idsocio = s.idsocio " +
            " and s.idtipodocumento = p.tipodocumento " +
            " and s.nrodocumento = p.nrodocumento " +
            " and p.tipodocumento = tp.idtipodocumento " +
            " and r.idtiporeclamo = tr.idtiporeclamo " +
            " and r.idestadoreclamo = er.idestadoreclamo " +
            " and r.iddomicilio = d.iddomicilio " +
            " and d.idcalle = c.idcalle " +
            " and d.idzona = z.idzona " +
            " and r.idordentrabajocorrectivo = " + nroOTC;

        SqlDataReader sdr = Datos.obtenerDataReader(sqlReclamo);
        List<Reclamo> reclamos = new List<Reclamo>();

        while (sdr.Read())
        {
            Reclamo  r = new Reclamo();
            r.NroReclamo = Convert.ToInt32(sdr["idreclamo"].ToString());
            r.NroSocio = Convert.ToInt32(sdr["idsocio"].ToString());
            r.Socio.DescTipoDoc = sdr["tipodoc"].ToString();
            r.Socio.NroDocumento = Convert.ToInt32(sdr["nrodocumento"].ToString());
            r.Socio.Nombre = sdr["nombre"].ToString();
            r.Fecha = Convert.ToDateTime(sdr["fecha"].ToString());
            r.Hora = Convert.ToDateTime(sdr["hora"].ToString());
            r.Socio.Apellido = sdr["apellido"].ToString();
            r.Descripcion = sdr["descripcion"].ToString();
            r.TipoReclamo = sdr["tiporeclamo"].ToString();
            r.Prioridad = sdr["prioridad"].ToString();
            r.Zona = sdr["desczona"].ToString();
            //r.NroOTC = Convert.ToInt32(sdr["idordentrabajocorrectivo"].ToString());
            reclamos.Add(r);

        }
        sdr.Close();
        return reclamos;

    }
    public List<Reclamo> buscarReclamosOTC1(int nroOTC)
    {
        String sqlReclamo = "select distinct r.idreclamo, r.descripcion descripcion, tr.descripcion tiporeclamo, s.idsocio as idsocio," + 
        " p.apellido, p.nombre, tp.descripcion tipodoc, p.nrodocumento, convert(char(10), r.fecha, 103) as fecha, convert(nvarchar(5), r.hora, 108) as hora," +
        " tr.prioridad, pr.descripcion as pri, c.nombre as calle, d.nrocalle, d.dpto, d.piso, z.descripcion desczona, d.iddomicilio" +
        " from Reclamo r with(NOLOCK), persona p with(NOLOCK), socio s with(NOLOCK), tiporeclamo tr with(NOLOCK)," +
        " estadoreclamo er with(NOLOCK), domicilio d with(NOLOCK), calle c with(NOLOCK), zona z with(NOLOCK), tipodocumento tp with(NOLOCK)," + 
        " prioridad pr with (NOLOCK)" +
        " where r.idordentrabajocorrectivo = " + nroOTC + 
        " and r.idsocio = s.idsocio" + 
        " and r.idestadoreclamo = er.idestadoreclamo" + 
        " and r.idtiporeclamo = tr.idtiporeclamo" +
        " and r.iddomicilio = d.iddomicilio" +
        " and r.prioridad = pr.idprioridad" +
        " and ((r.idtipodocumento is not null and r.nrodocumento is not null and p.tipodocumento = r.idtipodocumento and p.nrodocumento = r.nrodocumento) or" +
        " (r.idsocio is not null and s.idsocio = r.idsocio and s.idtipodocumento = p.tipodocumento and s.nrodocumento = p.nrodocumento))" +
        " and d.idcalle = c.idcalle" +
        " and d.idzona = z.idzona" + 
        " and tr.prioridad = pr.idprioridad" +
        " and p.tipodocumento = tp.idtipodocumento";

        SqlDataReader sdr = Datos.obtenerDataReader(sqlReclamo);
        List<Reclamo> reclamos = new List<Reclamo>();

        while (sdr.Read())
        {
            Reclamo r = new Reclamo();

            r.NroReclamo = Convert.ToInt32(sdr[0]);
            r.Descripcion = sdr[1].ToString();
            r.DescripcionTipoReclamo = sdr[2].ToString();
            r.NroSocio = Convert.ToInt32(sdr[3]);
            r.ApellidoSocio = sdr[4].ToString();
            r.NombreSocio = sdr[5].ToString();
            r.TipoDocDescrip = sdr[6].ToString();
            r.NroDoc = Convert.ToInt32(sdr[7]);
            r.Fecha = Convert.ToDateTime(sdr[8]);
            r.Hora = Convert.ToDateTime(sdr[9]);
            r.NroPrioridad = Convert.ToInt32(sdr[10]);
            r.DescPriodidad = sdr[11].ToString();
            r.Calle = sdr[12].ToString();

            if (sdr[13].GetType() != Type.GetType("System.DBNull"))
                r.NroCalle = Convert.ToInt32(sdr[13].ToString());
            else
                r.NroCalle = 0;

            if (sdr[14].GetType() != Type.GetType("System.DBNull"))
                r.Dpto = sdr[14].ToString();
            else
                r.Dpto = Convert.ToString("0");

            if (sdr[15].GetType() != Type.GetType("System.DBNull"))
                r.Piso = Convert.ToInt32(sdr[15].ToString());
            else
                r.Piso = 0;

            r.DescZona = sdr[16].ToString();
            r.IdDomicilio = Convert.ToInt32(sdr[17]);

            reclamos.Add(r);

        }
        sdr.Close();
        return reclamos;

    }
    public int buscarUltimoNroOTC()
    {
        String sql = "select max(idordentrabajo) idorden from ordentrabajocorrectivo with(NOLOCK)";
        int ultimoNro = Datos.obtenerMayor(sql);
        return ultimoNro;
    }

    public OrdenTrabajoCorrectivo crearOTC(int nroOrden, int idguardia, int domicilio, int priodidad)
    {
        String sql = "insert into ordentrabajocorrectivo "+
                     " (idordentrabajo, fechainicio, idestadoot, idguardiareclamo, iddomicilio, horainicio, prioridad) "+

                     " values (" + nroOrden + ", getDate(), " + (idguardia == -1 ? "2" : "1") + ", " + (idguardia == -1 ? "NULL" : idguardia.ToString()) + "," + domicilio + ", getdate(), " + priodidad + ")";//Generada? deberia ponerse en pendiente cuando finaliza el CU

        
        int insertado = Datos.ejecutarComando(sql);

        if (insertado > 0)
        {
            OrdenTrabajoCorrectivo otc = new OrdenTrabajoCorrectivo();
            otc.NroOTC = nroOrden;
            otc.FechaInicio = DateTime.Now;

            otc.Estado = idguardia == -1 ? "2" : "1";

            otc.NroGrupoGR = idguardia;
            otc.IdDomicilio = domicilio;
            otc.HoraInicio = DateTime.Now;
            otc.Prioridad = priodidad;
            //otc.TiempoResolucion = timeporesolucion;
            return otc;
        }
        return null;
    }


    public void buscarProblemasYSolucionesAsociadas(int tiporeclamo, int zona)
    {
        String sql = " select p.descripcion problema, s.descripcion solucion " +
                     " from ordentrabajocorrectivo otc with(NOLOCK), detalleordentrabajocorrectivo dotc with(NOLOCK), "+
                     " reclamo r with(NOLOCK), problema p with(NOLOCK), solucion s with(NOLOCK), domicilio d with(NOLOCK) " +
                     " where otc.idordentrabajo = dotc.idordentrabajo "+
                     " and r.idordentrabajocorrectivo = otc.idordentrabajo "+
                     " and dotc.idproblema = p.idproblema "+
                     " and s.idsolucion = dotc.idsolucion "+
                     " and d.iddomicilio = r.iddomicilio "+
                     " and otc.idestadoot = 4 "+
                     " and r.idtiporeclamo = "+tiporeclamo+
                     " and d.idzona = "+zona;

    }
    public int setearPrioridadOTC(int nroOTC, float prioridad)
    {
        string sql = "update ordentrabajocorrectivo set prioridad = @a" +
        " where idordentrabajo = @b";

        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", prioridad));
        param.Add(new SqlParameter("@b", nroOTC));

        int filas = 0;

        try
        {
            filas = Datos.ejecutarComando(sql, param);
        }
        catch (SqlException ole)
        {
            string msg = ole.Message.ToString();
        }

        return filas;
    }
    public bool crearOTC1(OrdenTrabajoCorrectivo otc)
    {
        List<SqlParameter> param = new List<SqlParameter>();

        param.Add(new SqlParameter("@a", otc.NroOTC));
        param.Add(new SqlParameter("@b", otc.FechaInicio));

        param.Add(new SqlParameter("@d", otc.Estado));
        param.Add(new SqlParameter("@e", otc.NroGrupoGR));
        param.Add(new SqlParameter("@f", otc.IdDomicilio));
        param.Add(new SqlParameter("@g", otc.HoraInicio));

        param.Add(new SqlParameter("@i", otc.Usuario));

        if (Convert.ToSingle(otc.TiempoResolucion) == 0)
            param.Add(new SqlParameter("@j", DBNull.Value));
        else
            param.Add(new SqlParameter("@j", otc.TiempoResolucion));

        param.Add(new SqlParameter("@k", otc.Prioridad));

        String sql = "insert into ordentrabajocorrectivo " +
        " (idordentrabajo, fechainicio, idestadoot, idguardiareclamo, iddomicilio, horainicio," +
        " idusuario, tiemporesolucion, prioridad) " +
        " values (@a, @b, @d, @e, @f, @g, @i, @j, @k)"; 

        int insertado = Datos.ejecutarComando(sql,param);
        bool correcto = false;

        if (insertado > 0)
        {
            correcto = true;
        }
        return correcto;
    }
    public void actualizarEstadoOTC(int nroOTC, int idestado)
    {
        String sql = " update ordentrabajocorrectivo  " +
                     " set idestadoot = " + idestado +
                     " where idordentrabajo = " + nroOTC;

        Datos.ejecutarComando(sql);
    }
    public OrdenTrabajoCorrectivo buscarOTC(int nroReclamo)
    {
        SqlParameter p = new SqlParameter("@a", nroReclamo);

        String sqlReclamo = "select otc.horainicio" +
        " from ordentrabajocorrectivo otc, reclamo r, tiporeclamo tr" +
        " where r.idordentrabajocorrectivo = otc.idordentrabajo" +
        " and r.idtiporeclamo = tr.idtiporeclamo" +
        " and r.idreclamo = @a";

        SqlDataReader sdr = Datos.obtenerDataReader(sqlReclamo, p); 
        OrdenTrabajoCorrectivo otc = new OrdenTrabajoCorrectivo();

        while (sdr.Read())
        {
            otc.HoraInicio = Convert.ToDateTime(sdr[0]);
        }
        
        sdr.Close();
        return otc;

    }
}
