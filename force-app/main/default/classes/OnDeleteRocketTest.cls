@isTest
public class OnDeleteRocketTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> oldSet = new Set<SObject>();
    OnDeleteRocketImpl rocket = new OnDeleteRocketImpl(oldSet);
    System.assertEquals(oldSet, rocket.exposeSet(), 'oldSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> oldMap = new Map<ID, SObject>();
    OnDeleteRocketImpl rocket = new OnDeleteRocketImpl(oldMap);
    System.assertEquals(oldMap, rocket.exposeMap(), 'oldMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> oldSet = new Set<SObject>();
    OnDeleteRocketImpl rocket = new OnDeleteRocketImpl(oldSet);
    System.assert(
      rocket.canTakeOff(TriggerOperation.BEFORE_DELETE, null),
      'Can Fire on before delete'
    );
    System.assert(
      rocket.canTakeOff(TriggerOperation.AFTER_DELETE, null),
      'Can Fire on after delete'
    );
    System.assertEquals(
      false,
      rocket.canTakeOff(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnDeleteRocketImpl extends OnDeleteRocket {
    public OnDeleteRocketImpl(Set<SObject> oldSet) {
      super(oldSet);
    }
    public OnDeleteRocketImpl(Map<ID, SObject> oldMap) {
      super(oldMap);
    }
    public override void flyOnBefore() {
      System.debug('Test');
    }
    public override void flyOnAfter() {
      System.debug('Test');
    }
    public Set<SObject> exposeSet() {
      return oldSet;
    }
    public Map<ID, SObject> exposeMap() {
      return oldMap;
    }
  }
}
