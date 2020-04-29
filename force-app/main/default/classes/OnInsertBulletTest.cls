@isTest
public class OnInsertBulletTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> newSet = new Set<SObject>();
    OnInsertBulletImpl bullet = new OnInsertBulletImpl(newSet);
    System.assertEquals(newSet, bullet.exposeSet(), 'newSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> newMap = new Map<ID, SObject>();
    OnInsertBulletImpl bullet = new OnInsertBulletImpl(newMap);
    System.assertEquals(newMap, bullet.exposeMap(), 'newMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> newSet = new Set<SObject>();
    OnInsertBulletImpl bullet = new OnInsertBulletImpl(newSet);
    System.assert(
      bullet.canFire(TriggerOperation.BEFORE_INSERT, null),
      'Can Fire on before insert'
    );
    System.assert(
      bullet.canFire(TriggerOperation.AFTER_INSERT, null),
      'Can Fire on after insert'
    );
    System.assertEquals(
      false,
      bullet.canFire(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnInsertBulletImpl extends OnInsertBullet {
    public OnInsertBulletImpl(Set<SObject> newSet) {
      super(newSet);
    }
    public OnInsertBulletImpl(Map<ID, SObject> newMap) {
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
