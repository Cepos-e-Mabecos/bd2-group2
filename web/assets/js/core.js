const url = "http://127.0.0.1:5000";
(async () => {
    const response = await fetch(`${url}/api/locais`);
    const data = await response.json();
    console.log(data)
    data["message"].forEach(local => {
       document.querySelector("#locais").innerHTML += `<option value="${local["cod_local"]}">${local["designacao"]}</option>`; 
    });
})();

(async () => {
    const response = await fetch(`${url}/api/restaurantes`);
    const data = await response.json();
    console.log(data);
})();