import OSM from "ol/source/OSM";
import { Map, View } from "ol";
import { Tile as TileLayer, Vector as VectorLayer } from "ol/layer";
import { ScaleLine, defaults as defaultControls } from "ol/control";

class ResultMap {
    constructor(element, center) {
        this.features = [];
        this.featuresSelected = [];
        this.moveSpeed = 200;

        const mapLayer = new TileLayer({
            source: new OSM(),
            });

        this.view = new View({
            projection: "EPSG:4326",
            center: center,
            zoom: 6,
            });

        var control = new ScaleLine({
            units: "metric",
            bar: true,
            steps: 5,
            text: true,
            minWidth: 200,
            });
        
        const map = new Map({
            controls: defaultControls().extend([control]),
            target: element,
            layers: [mapLayer],
            // layers: [mapLayer, this.jsonDataLayer, this.markerLayer],
            view: this.view,
            });
        this.map = map;
    }
}

let FeatureMap = {
    mounted() {
        console.log("featureMap mounted.");
        this.map = new ResultMap(this.el, [0, 0]);
        console.log(this.map.map);
    },
    beforeUpdate() {
        console.log("featureMap beforeUpdate.");
        console.log(this.map.map);
    },
    updated() {
        console.log("featureMap updated.");
        console.log(this.map.map);
    },
    destroyed() {
        console.log("featureMap destroyed.");
        console.log(this.map.map);
    },
    disconnected() {
        console.log("featureMap disconnected.");
        console.log(this.map.map);
    },
    reconnected() {
        console.log("featureMap reconnected.");
        console.log(this.map.map);
    },
};

export { FeatureMap };