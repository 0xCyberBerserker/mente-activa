const fallbackReleaseUrl = "https://github.com/0xCyberBerserker/mente-activa/releases";

function shortHash(value) {
  if (!value) return "n/a";
  return `${value.slice(0, 12)}...${value.slice(-12)}`;
}

function releaseSort(a, b) {
  return a.version < b.version ? 1 : -1;
}

function renderRows(releases) {
  const body = document.getElementById("release-table-body");
  body.innerHTML = "";

  const rows = [];
  releases.sort(releaseSort).forEach((release) => {
    release.assets.forEach((asset) => {
      if (asset.platform === "Source") {
        return;
      }
      rows.push(`
        <tr>
          <td>${release.version}</td>
          <td>${asset.platform}</td>
          <td>${asset.architecture}</td>
          <td>${asset.kind}</td>
          <td><a class="download-link" href="${asset.downloadUrl}">Descargar</a></td>
          <td class="hash" title="${asset.sha256 || ""}">${shortHash(asset.sha256)}</td>
        </tr>
      `);
    });
  });

  if (!rows.length) {
    body.innerHTML = '<tr><td colspan="6">No hay releases públicas todavía.</td></tr>';
    return;
  }

  body.innerHTML = rows.join("");
}

async function loadReleases() {
  const latestVersionNode = document.getElementById("latest-version");
  const latestReleaseLink = document.getElementById("latest-release-link");

  try {
    const response = await fetch("./data/releases.json", { cache: "no-store" });
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}`);
    }
    const data = await response.json();
    const releases = data.releases || [];
    renderRows(releases);
    if (releases.length > 0) {
      latestVersionNode.textContent = releases[0].version;
      latestReleaseLink.href = releases[0].url || fallbackReleaseUrl;
    } else {
      latestVersionNode.textContent = "Sin release publicada";
      latestReleaseLink.href = fallbackReleaseUrl;
    }
  } catch (error) {
    latestVersionNode.textContent = "Sin datos";
    latestReleaseLink.href = fallbackReleaseUrl;
    document.getElementById("release-table-body").innerHTML =
      '<tr><td colspan="6">No se pudo cargar el índice de releases.</td></tr>';
  }
}

loadReleases();
