function tableFromJson() {
  const url = 'http://localhost:3000/tests'
  // the json data.
  fetch(url, {
    method: 'GET',
    headers: {
        'Accept': 'application/json',
    },
  })
  .then(response => response.json())
  .then(json => {
    let col = ["cpf", "nome_paciente", "nome_médico", "tipo_exame", "resultado_tipo_exame"];
    let col_names = ["CPF", "Nome do Paciente", "Médico", "Tipo de Exame", "Resultado do Exame"];

    // Create a table.
    const table = document.createElement("table");
    table.className = 'table table-striped table-hover'


    // Create table header row using the extracted headers above.
    let tr = table.insertRow(-1);                   // table row.

    for (let i = 0; i < col_names.length; i++) {
      let th = document.createElement("th");      // table header.
      th.innerHTML = col_names[i];
      tr.appendChild(th);
    }

    // add json data to the table as rows.
    for (let i = 0; i < json.length; i++) {

      tr = table.insertRow(-1);

      for (let j = 0; j < col.length; j++) {
        let tabCell = tr.insertCell(-1);
        tabCell.innerHTML = json[i][col[j]];
      }
    }

    // Now, add the newly created table with json data, to a container.
    const divShowData = document.getElementById('showData');
    divShowData.innerHTML = "";
    divShowData.appendChild(table);

    console.log(json)
  }
  )
}
