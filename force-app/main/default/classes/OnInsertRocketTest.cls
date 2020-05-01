@isTest
public class OnInsertRocketTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newSet);
    System.assertEquals(newSet, rocket.exposeSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newMap);
    System.assertEquals(newMap, rocket.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> newSet = new Set<SObject>();
    OnInsertRocketImpl rocket = new OnInsertRocketImpl(newSet);
    System.assert(
      rocket.canFire(TriggerOperation.BEFORE_INSERT, null),
      'Can Fire on before insert'
    );
    System.assert(
      rocket.canFire(TriggerOperation.AFTER_INSERT, null),
      'Can Fire on after insert'
    );
    System.assertEquals(
      false,
      rocket.canFire(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnInsertRocketImpl extends OnInsertRocket {
    public OnInsertRocketImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnInsertRocketImpl(Map<ID, SObject> newMap) {
      super(newMap);
    }
    public void onBeforeFire() {
      System.debug('Test');
    }
    public void onAfterFire() {
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
