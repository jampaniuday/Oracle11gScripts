select sql_text
from v$sqltext_with_newlines
where (address, hash_value)
        = ( select sql_address, sql_hash_value
            from v$session, v$process
            where paddr = addr
                  and spid = '&processid'
          )
order by piece;