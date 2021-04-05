$(document).ready(function() {
		
		var oTable = $('#tableNationality').DataTable({
			initComplete : function() {
				var index = 0;
				var filters = $('select.filterSelect');
				this.api().columns([2, 3, 4]).every( function () {
					var column = this;
					var select = $(filters[index]);
					column.data().unique().sort().each(function (d, j) {
						var cnt = 0;
						column.data().each(function (m) {
							if (d == m) {cnt++;}
						});
						if (d != '') {
							select.append('<option value="' + d + '">' + d + ' (' + cnt + ')</option>')
						}
					});
					index++;
				});
			},
			"oLanguage" : {
				"sProcessing" : "Obdelujem...",
				"sLengthMenu" : "Prikaži _MENU_ zapisov",
				"sZeroRecords" : "Noben zapis ni bil najden",
				"sInfo" : "Prikazanih od _START_ do _END_ od skupno _TOTAL_ zapisov",
				"sInfoEmpty" : "Prikazanih od 0 do 0 od skupno 0 zapisov",
				"sInfoFiltered" : "(filtrirano po vseh _MAX_ zapisih)",
				"sInfoPostFix" : "",
				"sSearch" : "Išči po vseh stolpcih:",
				"sUrl" : "",
				"oPaginate" : {
					"sFirst" : "Prva",
					"sPrevious" : "Nazaj",
					"sNext" : "Naprej",
					"sLast" : "Zadnja"
				}
			}
		});
		
		$("#tableNationality thead th input[type=text]").on( 'keyup change', function () {
			
			oTable
				.column( $(this).parent().index()+':visible' )
				.search( this.value )
				.draw();
				
		});
		
		$("#tableNationality thead th .filterSelect").on( 'change', function () {
			var val = $.fn.dataTable.util.escapeRegex(
				$(this).val()
			);
			
			oTable
				.column( $(this).parent().index() )
				.search( val ? '^'+val+'$' : '', true, false )
				.draw();
		});
		
	});
	