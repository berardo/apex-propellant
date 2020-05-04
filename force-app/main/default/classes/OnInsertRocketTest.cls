@isTest
public class OnInsertRocketTest {
  @isTest
  public static void testSetConstructor() {
    List<SObject> newList = new List<SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newList);
    System.assertEquals(newList, rocket.exposeSet(), 'newList not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newMap);
    System.assertEquals(newMap, rocket.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    List<SObject> newList = new List<SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newList);
    System.assert(
      rocket.canTakeOff(TriggerOperation.BEFORE_INSERT, null),
      'Can Fire on before insert'
    );
    System.assert(
      rocket.canTakeOff(TriggerOperation.AFTER_INSERT, null),
      'Can Fire on after insert'
    );
    System.assertEquals(
      false,
      rocket.canTakeOff(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnInsertRocketImpl extends OnInsertRocket {
    public OnInsertRocketImpl(List<SObject> newList) {
      super(newList);
    }
    public OnInsertRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public override void flyOnBefore() {
      System.debug('Test');
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
