@isTest
public class OnUpdateRocketTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newSet);
    System.assertEquals(newSet, rocket.exposeNewSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testSetConstructors() {
    Set<SObject> newSet = new Set<SObject>();
    Set<SObject> oldSet = new Set<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newSet, oldSet);
    System.assertEquals(newSet, rocket.exposeNewSet(), 'newSet not properly assigned');
    System.assertEquals(oldSet, rocket.exposeOldSet(), 'oldSet not properly assigned');
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
    Set<SObject> newSet = new Set<SObject>();
    OnUpdateRocketImpl rocket = new OnUpdateRocketImpl(newSet);
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
    public OnUpdateRocketImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnUpdateRocketImpl(Set<SObject> newSet, Set<SObject> oldSet) {
      super(newSet, oldSet);
    }
    public OnUpdateRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public OnUpdateRocketImpl(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
      super(newMap, oldMap);
    }
    public void flyOnBefore() {
      System.debug('Test');
    }
    public void flyOnAfter() {
      System.debug('Test');
    }
    public Set<SObject> exposeNewSet() {
      return newSet;
    }
    public Set<SObject> exposeOldSet() {
      return oldSet;
    }
    public Map<ID, SObject> exposeNewMap() {
      return newMap;
    }
    public Map<ID, SObject> exposeOldMap() {
      return oldMap;
    }
  }
}
