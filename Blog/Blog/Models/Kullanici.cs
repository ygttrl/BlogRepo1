namespace Blog.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Kullanici")]
    public partial class Kullanici
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kullanici()
        {
            Makales = new HashSet<Makale>();
            Yorums = new HashSet<Yorum>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(10)]
        //[DisplayName("Kullanýcý Adý")] 
        public string KullaniciAdi { get; set; }

        [Required]
        [StringLength(10)]
        //[DisplayName("Þifre")]
        [DataType(DataType.Password)]
        public string Sifre { get; set; }

        [StringLength(50)]
        //[DisplayName("Ýsim")]
        public string isim { get; set; }

        [StringLength(50)]
        //[DisplayName("Soyisim")]
        public string Soyisim { get; set; }

        [StringLength(150)]
        //[DisplayName("E-mail")]
        [RegularExpression(@"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z",
        ErrorMessage = "Lütfen Geçerli Bir Eposta Giriniz!")]
        public string email { get; set; }

        public int YetkiId { get; set; }

        [Column(TypeName = "date")]
        public DateTime KayitTarihi { get; set; }

        public virtual Yetki Yetki { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Makale> Makales { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Yorum> Yorums { get; set; }
    }
}
