/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 10/05/12
 * Time: 23:47
 * To change this template use File | Settings | File Templates.
 */
package uk.co.dilkusha.view {
import robotlegs.bender.bundles.mvcs.Mediator;

import uk.co.dilkusha.controller.events.RemainingTimeChangeEvent;

public class TimeRemainingLabelMediator extends Mediator{

    [Inject]
    public var view:TimeRemainingLabel;

    public function TimeRemainingLabelMediator() {
    }

    override public function initialize():void {
        addContextListener(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, onTimeChanged, RemainingTimeChangeEvent);
    }

    protected function onTimeChanged(event:RemainingTimeChangeEvent):void {
        var seconds:Number = event.timeRemaining % 60;
        var minutes:Number = Math.floor(event.timeRemaining/60);
        view.text = minutes + ":" +( seconds.toString().length == 2? seconds.toString():"0" + seconds) ;
    }
}
}
