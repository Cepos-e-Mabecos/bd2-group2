const refreshLocais = async (url) => {
    const response = await fetch(`${url}/api/locais`);
    const data = await response.json();
    localStorage.setItem("locais", JSON.stringify(data["message"]));
}

const populateLocais = (data) => {
    let html = `<option selected disabled>Locais</option>`;
    data.forEach(local => {
        html += `<option value="${local["cod_local"]}">${local["designacao"]}</option>`;
    });
    document.querySelector("#locais").innerHTML = html;
    document.querySelector("#locais").addEventListener("change", (e) => {
        const data = JSON.parse(localStorage.getItem("restaurantes")).filter(obj => {
            return obj["cod_local"] == e["target"]["value"];
        });
        populateRestaurantes(data);
    });

}