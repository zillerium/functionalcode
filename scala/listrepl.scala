import scala.collection.mutable.ListBuffer
def f(num:Int,arr:List[Int]):List[Int] = {
    val x = List(1,2,3)
    var n = new ListBuffer[Int]()
    //println(x)
   // println(num)
   // for (i <- arr) {
   //     println(i)
   // }
    var arr2 = List()
      for (i <- arr; j <- 1 to num) {
        n += i
    }
    val nlist = n.toList
    return nlist
}
