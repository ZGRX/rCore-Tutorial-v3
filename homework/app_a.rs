use std::io;
use std::fs;

fn main() -> io::Result<()>{
    for entry_result in fs::read_dir(".")?{
        let entry = entry_result?;
        println!("{}",entry.file_name().to_string_lossy());
    }
    Ok(())
}
//作业逻辑
/*本程序的目标是显示当前目录下的文件名。Rust 中 "." 表示当前目录，
因此可以使用 std::fs::read_dir(".") 读取当前目录中的所有目录项。
遍历过程中得到的 entry 表示一个目录项，它不仅包含文件名，也可以包含路径、文件类型等相关信息。
由于本题只需要输出文件名，因此调用 entry.file_name() 取得文件名并打印。 */
