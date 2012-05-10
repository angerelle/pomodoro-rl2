/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 10/05/12
 * Time: 23:45
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.asserts.assertEquals;

import robotlegs.bender.extensions.localEventMap.impl.EventMap;

import uk.co.dilkusha.controller.events.RemainingTimeChangeEvent;
import uk.co.dilkusha.model.PomodoroDefaults;

import uk.co.dilkusha.view.TimeRemainingLabel;
import uk.co.dilkusha.view.TimeRemainingLabelMediator;

public class TestTimeRemainingLabelMediator {

    private var _mediator:TimeRemainingLabelMediator;
    private var _view:TimeRemainingLabel;
    private var _eventDispatcher:IEventDispatcher;

    public function TestTimeRemainingLabelMediator() {

    }

    [Before]
    public function setUp():void {
        _view = new TimeRemainingLabel();
        _eventDispatcher = new EventDispatcher();
        _mediator = new TimeRemainingLabelMediator();
        _mediator.eventMap = new EventMap(_eventDispatcher);
        _mediator.eventDispatcher = _eventDispatcher;
        _mediator.view = _view;
        _mediator.initialize();
    }

    [After]
    public function tearDown():void {

    }

    [Test]
    public function testLabelShows25mins():void {
        _eventDispatcher.dispatchEvent(new RemainingTimeChangeEvent(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, PomodoroDefaults.DEFAULT_POMODORO_LENGTH));
        assertEquals("25:00",_view.text);
    }

    [Test]
    public function testLabelShows7Mins5Secs():void {
        _eventDispatcher.dispatchEvent(new RemainingTimeChangeEvent(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, (7*60)+5));
        assertEquals("7:05",_view.text);

    }

    [Test]
    public function testLabelShowsZero():void {
        _eventDispatcher.dispatchEvent(new RemainingTimeChangeEvent(RemainingTimeChangeEvent.REMAINING_TIME_CHANGED, 0));
        assertEquals("0:00",_view.text);

    }

}
}
