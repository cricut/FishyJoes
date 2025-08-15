```mermaid
graph TD;
FishyJoes --> -bindings;
subgraph -bindings
CriGeo --> CriText;
CriGeo --> CriSVG;
CriGeo & CriRaster --> CriTrace;
CriGeo & CriRaster  --> Tesseract;
Tesseract & CriSVG & CriText --> Bifrost;
CriSVG --> CriCanvas;
CriText & CriRaster --> CriCanvas;
end
```
