const head = document.querySelector("head");
const css = [{
    "link": "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css",
    "integrity": "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
}, {
    "link": "https://use.fontawesome.com/releases/v5.8.2/css/all.css",
    "integrity": null
}, {
    "link": "https://fonts.googleapis.com/css?family=Indie+Flower",
    "integrity": null
}, {
    "link": "https://fonts.googleapis.com/css?family=Montserrat",
    "integrity": null
}, {
    "link": "https://fonts.googleapis.com/css?family=Roboto",
    "integrity": null
}];
css.forEach(style => {
    const link = document.createElement("link");
    link.rel = "stylesheet";
    link.href = style["link"];
    link.type = "text/css";
    if (style["integrity"] != null) {
        link.integrity = style["integrity"];
        link.crossOrigin = "anonymous";
    }
    head.appendChild(link);
});

// Waits for DOM Loaded to manipulate it
document.addEventListener("DOMContentLoaded", async () => {
    // Adds ease out of page
    document.querySelectorAll("a:not([target=_blank])").forEach(async (a) => {
        a.addEventListener("click", async (e) => {
            e.preventDefault();
            document.querySelector("body").style.opacity = "0";
            document.querySelector("body").style.pointerEvents = "none";
            document.querySelector("body").style.overflow = "hidden";
            setTimeout(() => {
                location.assign(a["href"]);
            }, 500);
        });
    });
});

// Waits for full page load to remove loader and initialize cookie
window.addEventListener("load", async () => {
    // Remove loader
    this.setTimeout(() => {
        document.querySelector("#loader").style.opacity = "0";
        document.querySelector("body").style.opacity = "1";
        setTimeout(() => {
            document.querySelector("#loader").remove();
        }, 500);
    }, 500);

    // Defers image loading
    document.querySelectorAll("img").forEach(async (img) => {
        if (img.getAttribute("data-src")) {
            img.setAttribute("src", img.getAttribute("data-src"));
        }
    });
});