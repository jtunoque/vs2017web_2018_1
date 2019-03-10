
(function (app) {
    app.ConsultaProductosStockView =
        {
        Init: function () {

            $(".ConsultaProductosStock .Buscar").on("click", this.Buscar);

            $("#ListaProductos").jsGrid(
                {
                    width: "100%",
                    height: "600px",
                    paging: true,
                    pageSize: 100,
                    pageIndex: 1,
                    autoload: true,
                    pageLoading:true,
                    fields:
                        [
                            { name:"Nombre", type:"text", width: 150 },
                            { name:"StockActual", type:"text", width: 150 }
                        ],
                    controller:
                        {
                            loadData: function (filter) {
                                            
                            var d = $.Deferred(); //Resultado diferido

                                $.ajax(
                                    {
                                        url: "/Producto/BuscarProductosStock",
                                        data: filter,
                                        dataType:"json"
                                    }
                                ).done(
                                    function (response) {
                                        var data = {
                                            data:response.Listado,itemsCount:response.TotalRows
                                        }

                                        d.resolve(data);
                                    }
                                );

                                //Returna el resultado diferido
                                return d.promise();
                            }
                        }

                }
            );



             },
        Buscar: function () {
            var filtros = {
                Nombre: $(".ConsultaProductosStock .Nombre").val(),
                Stock: $(".ConsultaProductosStock .Stock").val()
            };
            

            var grid = $("#ListaProductos").jsGrid("search", filtros);

            }
        }
        
})(window.app = window.app || {});

