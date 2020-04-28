public abstract class OnUpdateBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet;
  protected Set<SObject> oldSet;
  protected Map<ID, SObject> newMap;
  protected Map<ID, SObject> oldMap;
  
  @SuppressWarnings('PMD.EmptyStatementBlock') 
  private OnUpdateBullet() {
  }

  public OnUpdateBullet(Set<SObject> newSet) {
    this.newSet = newSet;
  }
  public OnUpdateBullet(Set<SObject> newSet, Set<SObject> oldSet) {
    this.newSet = newSet;
    this.oldSet = oldSet;
  }
  public OnUpdateBullet(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }
  public OnUpdateBullet(Map<ID, SObject> newMap, Map<ID, SObject> oldMap) {
    this.newMap = newMap;
    this.oldMap = oldMap;
  }
}
