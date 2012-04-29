/**
 * Created with IntelliJ IDEA.
 * User: angela.relle
 * Date: 30/04/12
 * Time: 00:14
 * To change this template use File | Settings | File Templates.
 */
package {
import org.flexunit.asserts.assertTrue;

public class TestTestsWorking {
    public function TestTestsWorking() {

    }


    [Before]
    public function setUp():void {

    }

    [After]
    public function tearDown():void {

}
    [Test]
    public function testPassing():void {
        assertTrue(true);
    }
}
}
