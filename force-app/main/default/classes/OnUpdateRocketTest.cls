@isTest
public class OnUpdateRocketTest {
  @isTest
  public static void testSetConstructor() {
    List<SObject> newList = new List<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newList);
    System.assertEquals(newList, rocket.exposeNewSet(), 'newList not properly assigned');
  }

  @isTest
  public static void testSetConstructors() {
    List<SObject> newList = new List<SObject>();
    List<SObject> oldList = new List<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newList, oldList);
    System.assertEquals(newList, rocket.exposeNewSet(), 'newList not properly assigned');
    System.assertEquals(oldList, rocket.exposeOldSet(), 'oldList not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newMap);
    System.assertEquals(newMap, rocket.exposeNewMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testMapConstructors() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    Map<ID, SObject> oldMap = new Map<ID, SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newMap, oldMap);
    System.assertEquals(newMap, rocket.exposeNewMap(), 'newMap not properly assigned');
    System.assertEquals(oldMap, rocket.exposeOldMap(), 'oldMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    List<SObject> newList = new List<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newList);
    System.assert(
      rocket.canTakeOff(TriggerOperation.BEFORE_UPDATE, null),
      'Can Fire on before update'
    );
    System.assert(
      rocket.canTakeOff(TriggerOperation.AFTER_UPDATE, null),
      'Can Fire on after update'
    );
    System.assertEquals(
      false,
      rocket.canTakeOff(TriggerOperation.AFTER_INSERT, null),
      'Cannot Fire on after insert'
    );
  }

  class OnUpdateRocketImpl extends OnUpdateRocket {
    public OnUpdateRocketImpl(List<SObject> newList) {
      super(newList);
    }
    public OnUpdateRocketImpl(List<SObject> newList, List<SObject> oldList) {
      super(newList, oldList);
    }
    public OnUpdateRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public OnUpdateRocketImpl(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
      super(newMap, oldMap);
    }
    public override void flyOnBefore() {
      System.debug('Test');
    }
    public override void flyOnAfter() {
      System.debug('Test');
    }
    public List<SObject> exposeNewSet() {
      return newList;
    }
    public List<SObject> exposeOldSet() {
      return oldList;
    }
    public Map<ID, SObject> exposeNewMap() {
      return newMap;
    }
    public Map<ID, SObject> exposeOldMap() {
      return oldMap;
    }
  }
}
