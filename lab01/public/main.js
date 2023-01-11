function tableFromJson() {
  const url = 'http://localhost:3000/tests'
  fetch(url, {
    method: 'GET',
    headers: {
        'Accept': 'application/json',
    },
  })
  .then(response => response.json())
  .then(json => {
    let col = ["cpf", "nome_paciente", "nome_médico", "tipo_exame", "resultado_tipo_exame", "token_resultado_exame"];
    let col_names = ["CPF", "Nome do Paciente", "Médico", "Tipo de Exame", "Resultado do Exame", "Token"];

    const table = document.createElement("table");
    table.className = 'table table-striped table-hover'


    let tr = table.insertRow(-1);

    for (let i = 0; i < col_names.length; i++) {
      let th = document.createElement("th");      // table header.
      th.innerHTML = col_names[i];
      tr.appendChild(th);
    }

    for (let i = 0; i < json.length; i++) {

      tr = table.insertRow(-1);

      for (let j = 0; j < col.length; j++) {
        let tabCell = tr.insertCell(-1);
        tabCell.innerHTML = json[i][col[j]];
      }

      var button = document.createElement("button");
      button.className = "btn btn-link"
      var aTag = document.createElement('a');
      var exams_token = json[i][col[5]]
      aTag.setAttribute('href',`http://localhost:3000/show/${exams_token}`);
      aTag.innerHTML = 'Detalhes';
      button.appendChild(aTag);

      tr.appendChild(button);
    }

    const divShowData = document.getElementById('showData');
    divShowData.innerHTML = "";
    divShowData.appendChild(table);

    console.log(json)
  }
  )
}
