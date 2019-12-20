const refreshRestaurantes = async (url) => {
    const response = await fetch(`${url}/api/restaurantes`);
    const data = await response.json();
    localStorage.setItem("restaurantes", JSON.stringify(data["message"]));
}

const populateRestaurantes = (data) => {
    let table = `
        <thead class="thead-light">
            <tr>
                <th scope="col">cod_restaurante</th>
                <th scope="col">designacao</th>
                <th scope="col">cod_local</th>
                <th scope="col">n_ementas</th>
                <th scope="col">n_locaisconsumo</th>
                <th scope="col">actions</th>
            </tr>
        </thead>
    `;
    table += `<tbody>`;
    data.forEach(restaurante => {
        table += `
            <tr>
                <th scope="row">${restaurante["cod_restaurante"]}</th>
                <td>${restaurante["designacao"]}</td>
                <td>${restaurante["cod_local"]}</td>
                <td>${restaurante["n_ementas"]}</td>
                <td>${restaurante["n_locaisconsumo"]}</td>
                <td>
                    <div class="btn-group role="group" aria-label="action-${restaurante["cod_restaurante"]}">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                            <i class="far fa-edit fa-fw"></i>
                        </button>
                        <button type="button" class="btn btn-success">
                            <i class="fas fa-play fa-fw"></i>
                        </button>
                    </div>
                </td>
            </tr>
        `;
    });
    table += `</tbody>`;
    document.querySelector("#restaurantes").innerHTML = table;
}