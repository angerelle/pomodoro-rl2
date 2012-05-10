/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 30/04/12
 * Time: 20:24
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;

import org.flexunit.assertThat;
import org.flexunit.asserts.assertFalse;

import org.flexunit.asserts.fail;

import org.flexunit.async.Async;

import robotlegs.bender.extensions.localEventMap.impl.EventMap;

import uk.co.dilkusha.controller.events.PomodoroUserInteractionEvent;

import uk.co.dilkusha.view.PomodoroStartButton;
import uk.co.dilkusha.view.PomodoroStartButtonMediator;

public class TestPomodoroStartButtonMediation {

    private var _view:PomodoroStartButton;
    private var _mediator:PomodoroStartButtonMediator;

    public function TestPomodoroStartButtonMediation() {

    }

    [Before]
    public function setUp():void {
         _view = new PomodoroStartButton();
        _mediator = new PomodoroStartButtonMediator();
        var eventDispatcher:IEventDispatcher = new EventDispatcher();
        _mediator.eventMap = new EventMap(eventDispatcher);
        _mediator.eventDispatcher = eventDispatcher;
        _mediator.view = _view;
        _mediator.viewComponent = _view;
        _mediator.initialize();
    }

    [After]
    public function tearDown():void {

    }

    [Test(async)]
    public function testClickingStartButtonCausesPomodoroStartEventToBeDispatched():void {
        _mediator.eventDispatcher.addEventListener(PomodoroUserInteractionEvent.POMODORO_STARTED_BY_USER, Async.asyncHandler(this, onPomodoroStarted,
                500, null, onTimeout), false, 0, true);
        _view.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    [Test]
    public function testClickingStartButtonDisablesTheButton():void {
        _view.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assertFalse(_view.enabled);
    }

    private function onPomodoroStarted(event:Event, passThroughData:Object):void {
    }

    private function onTimeout(passThroughData:Object):void {
        fail("Event never dispatched");
    }
}
}
