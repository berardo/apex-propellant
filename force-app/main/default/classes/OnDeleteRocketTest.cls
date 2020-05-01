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
      rocket.canFire(TriggerOperation.BEFORE_DELETE, null),
      'Can Fire on before delete'
    );
    System.assert(
      rocket.canFire(TriggerOperation.AFTER_DELETE, null),
      'Can Fire on after delete'
    );
    System.assertEquals(
      false,
      rocket.canFire(TriggerOperation.AFTER_UPDATE, null),
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
    public void onBeforeFire() {
      System.debug('Test');
    }
    public void onAfterFire() {
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
