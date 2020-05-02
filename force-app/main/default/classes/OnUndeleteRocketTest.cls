@isTest
public class OnUndeleteRocketTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newSet);
    System.assertEquals(newSet, rocket.exposeSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newMap);
    System.assertEquals(newMap, rocket.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> newSet = new Set<SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newSet);
    System.assert(
      rocket.canTakeOff(TriggerOperation.AFTER_UNDELETE, null),
      'Can Fire on after undelete'
    );
    System.assertEquals(
      false,
      rocket.canTakeOff(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnUndeleteRocketImpl extends OnUndeleteRocket {
    public OnUndeleteRocketImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnUndeleteRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public override void flyOnAfter() {
      System.debug('Test');
    }
    public Set<SObject> exposeSet() {
      return newSet;
    }
    public Map<ID, SObject> exposeMap() {
      return newMap;
    }
  }
}
