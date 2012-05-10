/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 10/05/12
 * Time: 23:09
 * To change this template use File | Settings | File Templates.
 */
package uk.co.dilkusha.view {
import flash.text.engine.FontWeight;

import spark.components.Label;

public class TimeRemainingLabel extends Label {
    public function TimeRemainingLabel() {
        setStyle("fontWeight", FontWeight.BOLD);
        text = "Waiting..."
    }
}
}
