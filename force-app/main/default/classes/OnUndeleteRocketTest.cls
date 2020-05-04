@isTest
public class OnUndeleteRocketTest {
  @isTest
  public static void testSetConstructor() {
    List<SObject> newList = new List<SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newList);
    System.assertEquals(newList, rocket.exposeSet(), 'newList not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newMap);
    System.assertEquals(newMap, rocket.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    List<SObject> newList = new List<SObject>();
    OnUndeleteRocketImpl rocket = new OnUndeleteRocketImpl(newList);
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
    public OnUndeleteRocketImpl(List<SObject> newList) {
      super(newList);
    }
    public OnUndeleteRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public override void flyOnAfter() {
      System.debug('Test');
    }
    public List<SObject> exposeSet() {
      return newList;
    }
    public Map<ID, SObject> exposeMap() {
      return newMap;
    }
  }
}
