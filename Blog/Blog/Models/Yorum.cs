namespace Blog.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Yorum")]
    public partial class Yorum
    {
        private int v1;
        private int v2;
        private DateTime dateTime;
        private string v3;

        public Yorum(int v1, int v2, DateTime dateTime, string v3)
        {
            this.v1 = v1;
            this.v2 = v2;
            this.dateTime = dateTime;
            this.v3 = v3;
        }

        public Yorum()
        {
        }

        public int id { get; set; }

        [Required]
        //[DisplayName("Yorum Ýçeriði")]
        public string YorumIcerik { get; set; }

        public int KullaniciId { get; set; }

        public int MakaleId { get; set; }

        public DateTime Tarih { get; set; }

        public virtual Kullanici Kullanici { get; set; }

        public virtual Makale Makale { get; set; }
    }
}
